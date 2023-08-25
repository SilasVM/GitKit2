## Creation of `Activity_1_Teacher.asciidoc`

1. Installed pandoc

    ```bash
    sudo apt-get update
    sudo apt-get install pandoc
    ```

2. Generate markdown

    ```bash
    pandoc Activity\ 1\ FOSS\ \(Teacher\).docx -o Activity_1_Teacher.asciidoc
    ```

3. Install asciidoc extension for VS Code

4. Massage (I didn't do this - but it needs it)

---

Pandoc produced better tables in asciidoc than it did for Markdown. That
might be because the builtin Markdown previewer in VS Code didn't support
the tables that Markdown produced (note that tables are not supported in
the origin markdown format; there are different "flavors/extensions" that
support tables; this is also probably why the asciidoc conversions did a
better job).
