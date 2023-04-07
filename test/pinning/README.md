# Pinning Test

This test performs a characterizing test of the deploy script.
We took a working version of the deploy script, mocked commands that
talk to GitHub and had them print the command along with its arguments,
which then produces a trace when the deploy script is ran. This trace
characterizes the behavior of a working deploy script. We save this
trace as `gold.raw`.

Now, as we refactor the deploy script, we can run the deploy script
with the same commands mocked to generate a new trace. If the new trace
matches `gold.raw`, then the new version likely behaves the same as the
original. To run this test run

    ```bash
    commands/test.sh
    ```

It may become necessary to change the behavior of the deploy script such
that its trace no longer matches the existing `gold.raw`. To generate a
new `gold.raw`, run

    ```bash
    commands/generate-gold.sh
    ```
