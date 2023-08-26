# The `format` branch

I'm looking for a good source format for authoring learning materials for
a Kit.

The ideal authoring format has the following characterstics:

* Works well with Git and GitLab and our development tools and processes
   so that we can produce quality, maintainable materials.
* Can be used to automatically generate a variety of other formats that
   instructors would
   like to work with and wan their students to work with. This is important
   because the consumption format needs to fit in well with the instructor's
   learning goals, the context of the class, and the context of tools
   and workflows that the instructor uses for their class; and all of these
   vary from instructor to instructor, and class to class.
* Ideally the generated formats "look good". But practically, the generated
   format needs to accurately convey the intent of the author and not distract
   from the goals of the assignment/activity/etc.
* Does not lead to duplication of content. We want a single source of content
   so that we don't have to maintain duplication.
* Lends itself to further automation. We should be able to write scripts
   to simplify instructor and student interaction with the material.
   For example, we should be able to insert URLs at key locations during
   deployment so that instructor's don't have to. We should be able to
   generate different variations of the material based on the insturctor's
   desidered client interface.

Some of these characteristics strongly imply that the source formate should
be in a plain-text file. Specifically, that it should work well with
development tools and workflows like Git and GitLab, that it should be
ameniable to automation, and from it we should be able to generate different
product formats.

Also, if we want to be able to generate different product formats, then
what can be expressed in the source format likely cannot be any more expressive
than the least expressive product format. Assuming that all product formats
can display an image, I suppose one could always generate images of the
original source format and just embed those into the product formats, but
this is undesireable. We really mean that the same content should be at
least approximated in the product format. If this is true, then if the
source format is capable of expressing something that is not possible in
one of the desired target formats, then either that construct should/must
be avoided or that source format may be unsuitable as a source format.
This suggests that we must use the "least-common-denominator" as the source
language. While I suspect some may not be happy with this from a theoretical
standpoint, from a practical standpoint this may be reasonable.

## `pandoc`

When it comes to command-line file conversion, `pandoc` is probably the
best we'll find. It can convert between MANY common formats. Unless someone
has a better idea, I think we need to live within the capabilities of
`pandoc`.

However, `pandoc` isn't perfect. And some conversions are better than others.
So, we're going to need to find a source format that reasonably translates
to our most desired target formats.

## Target formats

So what are the formats that we want to target? Here is an initial list.

* Word
* Google Doc
* Markdown
* PDF
* HTML

