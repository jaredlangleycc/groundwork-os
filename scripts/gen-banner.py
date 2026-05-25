#!/usr/bin/env python3
"""
Generate brand-aligned banner + social preview images for NightShiftOS.

Outputs:
- assets/banner.png         1600x500  README header
- assets/social-preview.png 1280x640  GitHub social preview (Settings > Social preview)

Usage:
  python3 scripts/gen-banner.py
"""

from PIL import Image, ImageDraw, ImageFont
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ASSETS = ROOT / "assets"
ASSETS.mkdir(exist_ok=True)

ARCHIVO = Path.home() / ".local/fonts/ArchivoBlack-Regular.ttf"
MANROPE = Path.home() / ".local/fonts/Manrope-Bold.ttf"

# Brand palette (matches CLAUDE.md spec)
TEAL = (10, 31, 32)
TEAL_MID = (16, 48, 50)
TEAL_DEEP = (24, 67, 69)
CREAM = (242, 237, 230)
GOLD = (212, 169, 106)
GOLD_DARK = (168, 125, 62)
MUTED = (139, 168, 154)


def load_font(path, size):
    return ImageFont.truetype(str(path), size)


def draw_text(draw, xy, text, font, fill):
    draw.text(xy, text, font=font, fill=fill)


def measure(draw, text, font):
    bbox = draw.textbbox((0, 0), text, font=font)
    return bbox[2] - bbox[0], bbox[3] - bbox[1]


def gen_banner():
    W, H = 1600, 500
    img = Image.new("RGB", (W, H), TEAL)
    d = ImageDraw.Draw(img)

    # Gold accent bar bottom
    d.rectangle([0, H - 8, W, H], fill=GOLD)

    # Measure wordmark FIRST so divider lands after it with padding
    wm_size = 88
    wordmark_font = load_font(ARCHIVO, wm_size)
    wm_x = 80
    wm_y = 130

    ns_w, ns_h = measure(d, "NIGHTSHIFT", wordmark_font)
    os_w, os_h = measure(d, "/OS", wordmark_font)
    full_wm_w = ns_w + os_w

    # Cream block width = wordmark + left padding + right padding
    right_padding = 90
    cream_w = wm_x + full_wm_w + right_padding

    # Draw cream left block
    d.rectangle([0, 0, cream_w, H - 8], fill=CREAM)

    # Vertical gold separator at end of cream block
    d.rectangle([cream_w - 4, 0, cream_w + 4, H - 8], fill=GOLD)

    # Wordmark text
    draw_text(d, (wm_x, wm_y), "NIGHTSHIFT", wordmark_font, TEAL)
    draw_text(d, (wm_x + ns_w, wm_y), "/OS", wordmark_font, GOLD_DARK)

    # Tagline (Manrope) under wordmark
    tagline_font = load_font(MANROPE, 28)
    tag = "For the mom or dad with a 9 to 5 and a 7pm idea."
    draw_text(d, (wm_x, wm_y + ns_h + 28), tag, tagline_font, TEAL_MID)

    # Sub-tagline smaller
    sub_font = load_font(MANROPE, 20)
    sub = "Family floor first. Free first. Built for Claude Code."
    draw_text(d, (wm_x, wm_y + ns_h + 70), sub, sub_font, MUTED)

    # Right side (teal area): meta badges
    right_col_x = cream_w + 80
    right_col_w = W - right_col_x - 60
    badge_label_font = load_font(MANROPE, 16)

    badges = [
        ("43", "skills"),
        ("8", "categories"),
        ("12", "section assessment"),
        ("MIT", "free + open"),
    ]
    big_font = load_font(ARCHIVO, 48)
    # Find widest big number for label alignment
    max_big_w = max(measure(d, big, big_font)[0] for big, _ in badges)

    row_y = 90
    row_gap = 78
    for big, small in badges:
        big_w, big_h = measure(d, big, big_font)
        draw_text(d, (right_col_x, row_y), big, big_font, GOLD)
        # Label sits to the right of widest big, vertically centered on big
        label_x = right_col_x + max_big_w + 20
        label_y = row_y + (big_h - 16) // 2 + 2
        draw_text(d, (label_x, label_y), small, badge_label_font, CREAM)
        row_y += row_gap

    out = ASSETS / "banner.png"
    img.save(out, "PNG", optimize=True)
    print(f"✓ Banner written: {out} ({W}x{H}, cream_w={cream_w})")


def gen_social_preview():
    W, H = 1280, 640
    img = Image.new("RGB", (W, H), CREAM)
    d = ImageDraw.Draw(img)

    # Top gold bar
    d.rectangle([0, 0, W, 12], fill=GOLD)
    # Bottom teal section
    d.rectangle([0, int(H * 0.78), W, H], fill=TEAL)

    # Wordmark
    wm_font = load_font(ARCHIVO, 80)
    wm_x = 80
    wm_y = 100
    ns_w, ns_h = measure(d, "NIGHTSHIFT", wm_font)
    draw_text(d, (wm_x, wm_y), "NIGHTSHIFT", wm_font, TEAL)
    draw_text(d, (wm_x + ns_w, wm_y), "/OS", wm_font, GOLD_DARK)

    # Big tagline (Archivo, multi-line)
    big_font = load_font(ARCHIVO, 64)
    line1 = "FOR THE MOM OR DAD WITH"
    line2 = "A 9 TO 5 AND A 7PM IDEA."
    draw_text(d, (wm_x, 240), line1, big_font, TEAL_MID)
    draw_text(d, (wm_x, 240 + 80), line2, big_font, TEAL_MID)

    # Sub tagline (Manrope)
    sub_font = load_font(MANROPE, 28)
    sub = "The 1 person business OS. Family floor first. Free, MIT licensed."
    draw_text(d, (wm_x, 430), sub, sub_font, TEAL)

    # Bottom strip text on teal
    bottom_font = load_font(MANROPE, 22)
    bottom = "github.com/jaredlangleycc/nightshift-os    |    by Jared Langley"
    draw_text(d, (wm_x, int(H * 0.78) + 30), bottom, bottom_font, CREAM)

    # Gold accent line above bottom strip
    d.rectangle([0, int(H * 0.78) - 4, W, int(H * 0.78)], fill=GOLD)

    out = ASSETS / "social-preview.png"
    img.save(out, "PNG", optimize=True)
    print(f"✓ Social preview written: {out} ({W}x{H})")


if __name__ == "__main__":
    gen_banner()
    gen_social_preview()
