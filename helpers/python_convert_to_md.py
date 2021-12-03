with open("/Users/garrettsweeney/git/docs/PYTHON.md", "w") as f:
    # Write Python rst header
    f.write("# Python\n")
    # Note about programatic generation
    f.write(
        "> This document is generated programatically from helpers/pytest_python_utilities\n\n"
    )

    f.write(
        "## Imports\n"
    )
    f.write(
        "```python\n"
    )

    with open("/Users/garrettsweeney/git/docs/helpers/pytest_python_utilities.py") as reader:
        for line in reader.readlines():
            if '"""' in line:
                f.write("```\n")
                # Clean the line of python comment
                cleaned_line = line.replace('"', "").strip()
                # Write the cleaned line
                f.write("## " + cleaned_line + "\n")
                # Code block for code-to-follow
                f.write("```python\n")
            else:
                f.write(line)
