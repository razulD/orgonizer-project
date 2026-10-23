# File Organizer (`orgonizer.sh`)

A lightweight, interactive Bash script designed to clean up messy directories by categorizing and moving files based on their extensions.

---

## Features

- **Home Directory Inspection**: Displays a list of main directories in your `$HOME` path for easy selection.
- **File Type Analytics**: Scans the target folder and outputs a summary of all existing file extensions along with file counts.
- **Input Sanitization**: Handles extension inputs cleanly whether provided with or without a leading dot (e.g., `.pdf` vs `pdf`).
- **Safe Directory Creation**: Automatically creates target destination folders without throwing errors if they already exist (`mkdir -p`).

---

## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone git@github.com:razulD/orgonizer-project.git
   cd orgonizer-project
   ```

2. **Make the script executable:**
   ```bash
   chmod +x orgonizer.sh
   ```

3. **Run the script:**
   ```bash
   ./orgonizer.sh
   ```

---

## Usage Example

```text
 Hello , Where you want to orgonize ?
/home/user/Desktop/
/home/user/Documents/
/home/user/Downloads/

PLS WRITE ADDRESS FOR DIR YOU WANT TO ORGONIZE :/home/user/Downloads

WHAT TYPE OF FILES YOU WANT TO ORGONIZE?
   15 pdf
    8 png
    3 zip
    1 apk

TYPE FILE EXTENSION : pdf
Well and now choose name for new folder PDF_Files
Done ! Moved all .pdf files into PDF_Files/
```

---

## Roadmap / Planned Improvements

- [ ] Add support for tilde (`~`) path expansion in target input.
- [ ] Add check to verify if matching files exist before prompting for folder creation.
- [ ] Add an auto-sort option to organize all file types into folders simultaneously.
- [ ] Implement an `--undo` option to revert recent file moves using a operation log.

---

## License

This project is open source and available under the [MIT License](LICENSE).
