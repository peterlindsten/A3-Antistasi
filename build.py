"""
build.py
Copy together maps and mission files, packing A3 mods

Requires python >= 3.5
"""

import argparse
import xml
import os
import shutil
from pathlib import Path
import logging
import distutils.dir_util
import subprocess


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", default=os.path.dirname(os.path.abspath(__file__)),
                        help="Base folder, defaults to script file location")
    parser.add_argument("--out", default="out",
                        help="Output directory, will be recreated")
    parser.add_argument("--maps", default="A3/maps",
                        help="Map templates directory, multiple subdirectories assumed")
    parser.add_argument("--data", default="A3-Antistasi",
                        help="Main mission files")
    parser.add_argument("--addonbuilder", default="addonbuilder.exe",
                        help="Path to addonbuilder, assumed on PATH")
    parser.add_argument("--filebank", default="filebank.exe",
                        help="Path to filebank for packing missions only, assumed on PATH")
    parser.add_argument("--pack", "-p", action='store_true',
                        help="Also pack missions to .pbo")
    return parser.parse_args()


def main(root, outdir, mapsdir, datadir, addonbuilder, filebank, pack):
    if (outdir.exists()):
        logging.info("Removing %s", root / outdir)
        shutil.rmtree(root / outdir)
    os.makedirs(root / outdir)
    for mapdir in (root / mapsdir).iterdir():
        newdir = mapdir.name
        logging.info("Processing %s", newdir)
        mapout = root / outdir / newdir
        shutil.copytree(root / datadir, mapout)
        distutils.dir_util.copy_tree(
            str(root / mapsdir / mapdir), str(mapout))
        if (pack):
            logging.info("Packing %s", newdir)
            subprocess.run([str(filebank), "-dst",
                            str(root / outdir), str(mapout)])

    for moddir in (root / "A3" / "mods").iterdir():
        for addon in (moddir / "addons").iterdir():
            logging.info("Packing %s", addon.name)
            subprocess.run([str(addonbuilder), str(addon),
                            str(root / outdir / moddir.name / "addons"), "-packonly"])


if (__name__ == "__main__"):
    FORMAT = '%(asctime)-15s [%(levelname)s] %(message)s'
    logging.basicConfig(format=FORMAT, level=logging.INFO)
    args = parse_arguments()
    main(Path(args.root), Path(args.out), Path(args.maps),
         Path(args.data), Path(args.addonbuilder), Path(args.filebank), args.pack)
