"""
build.py
Copy together maps and mission files, packing A3 mods

Requires python >= 3.5
"""

import argparse
import xml
import os
import shutil
import xml.etree.ElementTree as ET
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
    parser.add_argument("--maps", default="Map-Templates",
                        help="Map templates directory, multiple subdirectories assumed")
    parser.add_argument("--data", default="A3-Antistasi",
                        help="Main mission files")
    parser.add_argument("--filebank", default="filebank.exe",
                        help="Path to filebank, assumed on PATH")
    parser.add_argument("--pack", "-p", action='store_true',
                        help="Also pack missions to .pbo")
    return parser.parse_args()


def main(root, outdir, mapsdir, datadir, filebank, pack):
    if (outdir.exists()):
        logging.info("Removing %s", root / outdir)
        shutil.rmtree(root / outdir)
    os.makedirs(root / outdir)
    stringtable = ET.parse(root / datadir / "Stringtable.xml")
    version = stringtable.find(
        ".//Key[@ID='STR_antistasi_credits_generic_version_text']/Original").text
    logging.info("Found version %s", version)
    dashversion = "-".join(version.split("."))
    for mapdir in (root / mapsdir).iterdir():
        parts = mapdir.name.split(".")
        newdir = ".".join(["-".join([parts[0], dashversion]), *parts[1:]])
        logging.info("Processing %s", newdir)
        shutil.copytree(root / datadir, root / outdir / newdir)
        distutils.dir_util.copy_tree(
            str(root / mapsdir / mapdir), str(root / outdir / newdir))
        if (pack):
            logging.info("Packing %s", newdir)
            subprocess.run([str(filebank), "-dst",
                            str(root / outdir), str(root / outdir / newdir)])

    for moddir in (root / "A3").iterdir():
        for addon in (moddir / "addons").iterdir():
            logging.info("Packing %s", addon.name)
            subprocess.run([str(filebank), "-dst",
                            str(root / outdir / moddir.name / "addons"), str(addon)])


if (__name__ == "__main__"):
    FORMAT = '%(asctime)-15s [%(levelname)s] %(message)s'
    logging.basicConfig(format=FORMAT, level=logging.INFO)
    args = parse_arguments()
    main(Path(args.root), Path(args.out), Path(args.maps),
         Path(args.data), Path(args.filebank), args.pack)
