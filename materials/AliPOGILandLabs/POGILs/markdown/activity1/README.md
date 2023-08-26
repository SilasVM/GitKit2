## Creation of `Activity_1_Teacher.md`

1. Installed pandoc

    ```bash
    sudo apt-get update
    sudo apt-get install pandoc
    ```

2. Generate markdown

    ```bash
    pandoc Activity\ 1\ FOSS\ \(Teacher\).docx -o Activity_1_Teacher.md
    ```

3. Open Activity\ 1\ FOSS\ \(Teacher\).docx and edit Activity_1_Teacher.md in
    VS Code and start its previewer and then massage the Markdown as follows

    1. Update/fix headers
    2. Convert most tables into lists.
    3. Use quote blocks (\>) labeled with **ANSWERS:** and **INSTRUCTOR**
        to mark chunks that should be removed before giving to students.
        These need to be made more consistent, and might need furhter tuning
        so that we can write a script to generate student files.
    4. Export pictures as png files and include them.
    5. Generally fix the format of the document.

In total, this took about an hour.
