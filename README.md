# Instructor Guide for the GitKit

The GitKit introduces students to the fundamental skills and concepts (including git / GitHub) used in collaborative Free and Open Source Software (FOSS) development. It introduces students to the [forking workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow) and guides them through its use. The GitKit provides classroom materials, hands-on assignments, genuine project artifacts (repository, code, documentation, issues), and a development environment that support teaching these skills and concepts in the context of an authentic FOSS project. 

## Outline

- [GitKit Educational Materials](#gitkit-educational-materials) - Overview of the GitKit and its associated learning materials.
  - [GitKit Topics](#gitkit-topics) - Brief descriptions of the GitKit topics with links to the learning materials.
  - [Delivering the GitKit](#delivering-the-gitkit) - Examples of alternative deliveries of the GitKit.
  - [The FarmData2 Project](#the-farmdata2-project) - Information about the FarmData2 project.
- [The Development Environments](#the-development-environments) - Description of the KitClient development environments.
  - [The Kit-tty](#the-kit-tty) - Information about the Kit-tty virtual assistant.
  - [Community Automations](#community-automations) - Information about the simulated community interactions.
- [Using the GitKit](#using-the-gitkit) - Overview of what instructors and students must do to use the GitKit. 
  - [Deploying the GitKit](#deploying-the-gitkit) - Description of what it means to deploy the GitKit.
  - [Deploy Prerequisites](#deploy-prerequisites) - Dependencies for an instructor wanting to deploy the GitKit.
  - [Deploy Instructions](#deploy-instructions) - Step-by-step instructions for an instructor deploying the GitKit.
- [Instructor Notes](#instructor-notes) - Notes providing information and tips for the classroom delivery of each topic.
  - [Topic 1: Community and Collaboration](#topic-1-community-and-collaboration)
    - [Topic 1 Synopsis](#topic-1-synopsis)
    - [Topic 1 Instructor To-Do List](#topic-1-instructor-to-do-list)
    - [Topic 1 Activity Notes](#topic-1-activity-notes)
  - [Topic 2: Working Local & Upstreaming](#topic-2-working-local--upstreaming)
    - [Topic 2 Synopsis](#topic-2-synopsis)
    - [Topic 2 Instructor To-Do List](#topic-2-instructor-to-do-list)
    - [Topic 2 Activity Notes](#topic-2-activity-notes)
  - [Topic 3: Staying Synchronized](#topic-3-staying-synchronized)
    - [Topic 3 Synopsis](#topic-3-synopsis)
    - [Topic 3 Instructor To-Do List](#topic-3-instructor-to-do-list)
    - [Topic 3 Activity Notes](#topic-3-activity-notes)
  - [Topic 4: Merge Conflicts](#topic-4-merge-conflicts)
    - [Topic 4 Synopsis](#topic-4-synopsis)
    - [Topic 4 Instructor To-Do List](#topic-4-instructor-to-do-list)
    - [Topic 4 Activity Notes](#topic-4-activity-notes)
- [Acknowledgments](#acknowledgments)

## GitKit Educational Materials

The GitKit breaks its introduction to collaborative software development into the 4 topics briefly described in the [GitKit Topics](#gitkit-topics) section just below. For each topic, the GitKit provides a set of classroom materials (Slides) and a set of hands-on exercises for the students (Activity). These materials are written with the assumption that the GitKit is the students' first formal introduction to FOSS and git / GitHub.  Nominally each topic can be presented in a 75 minute class period and the associate activity can be completed with 2-3 hours of homework or during a lab period. However, the GitKit is flexible and several successful adaptations are briefly described in the [Delivering the GitKit](#delivering-the-gitkit) section below. 

### GitKit Topics

__Topic 1. Community and Collaboration:__ [[Slides](./materials/slides/1-S-CommunityAndCollaboration.pptx?raw=true) | [Activity](./materials/activities/1-A-CommunityAndCollaboration.docx?raw=true)]
   - Introduces Free and Open Source Software (FOSS) communities, and how they collaborate using version control (e.g. git) and repository hosting (e.g. GitHub).
   - Provides hands-on practice with the _issue tracker_, and _forking_ and _cloning_ of a repository.

__Topic 2. Working Local & Upstreaming:__ [[Slides](./materials/slides/2-S-WorkingLocallyAndUpstreaming.pptx?raw=true) | [Activity](./materials/activities/2-A-WorkiongLocallyAndUpstreaming.docx?raw=true)]
   - Introduces feature branches, commits, and pull requests as part of the forking workflow.
   - Provides practice with creating and switching _branches_, _staging_ and _committing_ changes, _pushing_ branches to origin and submitting _pull requests_.

__Topic 3. Staying Synchronized:__ [[Slides](./materials/slides/3-S-StayingSynchronized.pptx?raw=true) | [Activity](./materials/activities/3-A-StayingSynchronized.docx?raw=true)]
   - Introduces merges into the upstream that result in a developer's local clone becoming _out of synch_, and explains how to re-synchronize.
   - Provides practice with setting an _upstream remote_, _pulling_ (non-conflicting) changes from upstream, and _deleting_ feature branches. The exercises provide additional practice with the skills from topics 1 and 2 as well.

__Topic 4. Merge Conflicts:__ [[Slides](./materials/slides/4-S-MergeConflicts.pptx?raw=true) | [Activity](./materials/activities/4-A-MergeConflicts.docx?raw=true)]
   - Introduces conflicting changes that lead to merge conflicts and how they can be resolved.
   - Includes practice with _merging_ main into a feature branch, raw _merge conflict_ representation, using a graphical _merge tool_ and updating a pull request.

### Delivering the GitKit

While the GitKit was designed for nominal delivery in four 75-minute periods with 2-3 hours of additional hands-on work by the students, instructors have found the GitKit to be adaptable to different educational settings, student experience levels and learning objectives. 

- __Limited Coverage:__ The first two GitKit topics form a cohesive unit and can be completed without continuing onto the final two topics. Two examples of how this can be used include:
  - __Lower Level Courses:__ In lower level courses, or with less experienced students, the first two topics could be spread over a longer time with the hands-on activities being completed in class. 
  - __A One Day Workshop:__ An organization delivered the GitKit as a one-day workshop for students from low-income, first-generation, underrepresented minority backgrounds. This workshop covered just the first two GitKit topics.
- __Students with Prior git Experience:__ An instructor with students who have had prior exposure to git fundamentals (but not GitHub or the forking workflow) have skipped most of the class materials and used the hands-on activities as in-class lab activities rather than homework.
- __POGIL Activities:__ Another instructor is currently developing a set of Process Oriented Guided Inquiry (POGIL) activities to be used in class in place of GitKit's more traditional slides. 

Finally, it is worth mentioning that all of the work on the GitKit is being conducted under open licenses (GPL3, CC-BY-NC-SA) that welcome participation, contribution and derivative work.  Active work on the GitKit is taking place in [the Kits section of the HFOSSedu GitLab Organization](https://gitlab.com/hfossedu/).

### The FarmData2 Project

The GitKit uses artifacts from the [FarmData2 project](https://github.com/DickinsonCollege/FarmData2). FarmData2 aims to support farmers in the day-to-day operation and record keeping needs of their small organic diversified vegetable farms. However, it is important to note that no farming knowledge is necessary to compete the GitKit.

## The Development Environments

Students complete the hands-on GitKit activities using a _KitClient_.  A KitClient is a pre-configured containerized development environment that provides all of the tools and configuration necessary to complete the activities.  The KitClient also includes the (_Kit-tty Virtual Assistant_)[#the-kit-tty] and a set of (_Community Automations_)[#community-automations]. The Kit-tty virtual assistant notices errors that are commonly made by students when completing the hands-on activities and provides timely context-sensitive feedback and hints. The community automations simulate some of the activity of a FOSS community (e.g. assigning issues, and providing feedback on Pull Requests). 

There are currently two KitClients that can be used with GitKit. They are functionally equivalent. An instructor can choose which to use based on their class and students. 
- __Linux KitClient:__  This KitClient is a full Linux system with its own GUI desktop and students interact with the GitKit using this system as a virtual machine (VM) in a window on their own machine.
- __VSCode KitClient:__ This KitClient runs within Visual Studio Code as a _Dev Container_ and students interact with the GitKit through a shell within VS Code on their own machine.

To run a KitClient, students themselves need only install Docker and either a VNC Client (recommended for the Linux KitClient), or VSCode and Git (required for the VSCode KitClient). The instructions for these installations and starting the KitClients are relatively short and are included in the first GitKit activity.

### The Kit-tty

The Kit-tty (a play on Kit and TTY), pronounced _kitty_, is a virtual assistant in the KitClient that catches common student errors and provides hints on how to perform activity steps correctly. The Kit-tty has been designed to catch and correct student errors that were frequently observed in early uses of the GitKit. Many of the errors recognized by the Kit-tty are those that typically are not discovered until students progress several steps further into the activity, at which point they require more advanced git skills to undo.

For example, the Kit-tty intervenes when a student attempts to:
- commit to the main branch (an action that should not happen in the forking workflow).
- merge a feature branch into main (instead of vice versa). 
- set the upstream remote to the origin (instead of the upstream).
- clone the upstream (rather than their fork).
- clone one repository inside of another.

### Community Automations

Community automations perform actions and comment on tickets in the issue tracker and on pull requests. These actions and comments are designed to simulate some common types of interaction with project maintainers and other FOSS community at appropriate points in the learning activities. 

For example:
- When completing the first activity students request to be assigned an issue by adding a comment to its ticket in the issue tracker. An automation notices this comment, assigns the issue to the student (if it hasn't already been assigned to someone else). The automation then also responds personally as a maintainer might: ``Great! I assigned you (@TheirUsername) to the issue.  Have fun working on it!'' 
- Several additional community automations are currently in development.

## Using the GitKit

In order to use the GitKit faculty must [_deploy_](#deploying-the-gitkit) and students must install some dependencies on their machines, or they maybe provided on lab machines accessible to the students. Additional information about these dependencies are included in the [Detailed Instructor Notes](#detailed-instructor-notes) for the [first GitKit activity](#community-and-collaboration).

### Deploying the GitKit

Deploying the GitKit will create the `GitKit_FarmData2` repository that students will use as the upstream repository for the hands-on GitKit activities.  This repository will contain the code, documentation and history from the FarmData2 project and will have an issue tracker that is populated with the tickets used in the activities. It will also be specially configured to interact with the KitClient to configure the Kit-tty and to provide the community automations.

**Important Note:** Each deployment supports up to 32 students. If you have more than 32 students you will need to perform multiple deploys and direct sub-sets of students to each upstream repository.

### Deploy Prerequisites

Docker is required to deploy the GitKit.  Instructions for installing Docker Desktop can be found on the [Overview of Docker Desktop](https://docs.docker.com/desktop/) page.

### Deploy Instructions

Once you have Docker installed, the following steps will deploy a GitKit-FarmData2 repository in a GitHub space that you specify.

1. On GitHub, identify or create the GitHub location into which you wish to deploy
   the GitKit. This can be your personal namespace, or it can be any organization
   that you control. 
   - **NOTE:** If you need multiple GitKit deploys, create one (using these instructions) and then rename the repository (e.g. `GitKit_FarmData2_1`). Then follow these instructions again to deploy each additional `GitKit_FarmData2` repository.  Similarly, if you are deploying in a subsequent semester, you will need to rename or delete any prior `GitKit_FarmData2` repository.

2. On GitHub, create a classic personal access token ([directions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-personal-access-token-classic)), that expires in 7-days, with the following scopes
   * repo (all)
   * workflow
   * admin:org
     * read:org

3. Run the following command replacing `<token>` with the personal access token you just created, and `<org>` with either a URL (without a trailing slash) to GitHub organization or username to deploy into (e.g., `https://github.com/yourOrganizaion`) or alternatively you may use just the org or user name (e.g., `yourUsername`).

   ```bash
   docker run --rm -it -e GH_TOKEN=<token> registry.gitlab.com/hfossedu/kits/gitkit:latest <org>
   ```

   For example, the following would (if the token were valid) deploy the GitKit into the `wne-cs220-s2023` organization.

   ```bash
   docker run --rm -it -e GH_TOKEN=ghp_QWERTYasdf1234POIUljhxcvb registry.gitlab.com/hfossedu/kits/gitkit:latest wne-cs220-s2023
   ```

4. When the deploy in step 3 completes, ensure that the "Workflow permissions" for the new `GitKit-FarmData2` repository grant the `GITHUB_TOKEN` "Read and write permissions."
   - If you deployed to: 
     - an organization, then go to the organization page in GitHub.
     - a personal GitHub space, then go to the new `GitKit-FarmData2` repository page in GitHub.
   - Open the "Settings" (the "gear" icon top right)
   - Select "Actions" -> "General" in the left-hand menu.
   - Click "Read and write permissions" in the "Workflow Permissions" section.

5. If performing multiple deploys, rename the `GitKit-FarmData2` repository and return to step 1.

## Instructor Notes

By far the best, and highly recommended, way to prepare to deliver the GitKit is to deploy it, review the slides and complete the hands-on learning activities yourself - playing the roles of both instructor and student. 

The slides and the hands-on activities complement each other. The slides focus on conceptual understanding, while the hands-on activities connect those concepts to specific skills (e.g. git commands). The slides for each topic contain extensive _speaker notes_ that provide context, narrative descriptions, additional information and supplemental examples. It is suggested that the slides, with the speaker notes," be made available to the students for reference, with the suggestion that they treat the speaker notes as they would a text.  

In addition, to the "Speaker Notes" the following sections give additional information that may be helpful to instructors delivering the GitKit.  Provided for each topic are:
- A Synopsis - a summary of the content of slides to provide context, tips and clarification for the instructor.  The synopsis follows the slides for the topic and may be best read while reviewing the slides. 
- An Instructor To-Do List - a list of tasks that the instructor will need to complete before or during the class period(s) in which the topic is introduced.
- Activity Notes - a list of comments related to specific questions in the hands-on activity. 

### Topic 1: Community and Collaboration

#### Topic 1 Synopsis

This topic introduces students to Free and Open Source Software (FOSS), FOSS community principles and roles. The materials assume that this is the student's first introduction to FOSS and aim to develop a conceptual picture and an introductory working knowledge rather than mastery.  

- **Slide 2**

  The [Grandma Mae _Cookie Video_](https://www.youtube.com/watch?v=Tyd0FO0tko8 ) provides a good working metaphor for how FOSS collaboration works.  Students are asked to identify key FOSS vocabulary terms from this video.  Of that vocabulary, the following terms are most essential and are useful to refer back to through the remainder of the GitKit materials. The discussion following the video should ensure that they are clearly defined: 
  - Roles - captures the idea that different project community members have different responsibilities.  Two of the key roles mentioned are:
    - Maintainer - (e.g. Grandma Mae) - a trusted community member that has write access to the definitive version of the project (i.e. the main branch / upstream).
    - Contributor - (e.g. Aunt Maria, Uncle Miles) - a community member who is helping the project in some way (i.e. is upstreaming), but does not have write access to the upstream. They contribute to the project through discussion, documentation, proposing changes, providing code that fixes bugs or implements features, and many other ways.

  - Upstreaming - the process of contributors proposing changes and the maintainers integrating those changes into the definitive version of the project.

  - Main branch - the definitive version of the project (e.g. Grandma Mae's recipe).  Note that there may be multiple copies of this recipe (i.e. multiple copies of the main branch). 

    - Upstream - This term is not given in the video but is worth grounding in the Cookie metaphor because it is important in the remainder of the GitKit materials.  
  
      In this context, the _upstream_ is what contains the copy of the main branch that can only be changed by the maintainers (i.e. Grandma Mae's copy of the main branch).  The term _upstream_ captures the idea that changes that are "upstreamed" are integrated into the "upstream" copy of the main branch.

      Note that contributors may propose changes to the upstream main branch, but they will not have sufficient privileges to integrate those changes.  Only maintainers have the permissions necessary to make changes to the upstream main branch.

      This fact becomes important in the GitKit Topic 2, where the rule that "only maintainers should change the main branch" is introduced.  This discussion should foreshadow that rule.

  - Branch or Patch - A collection of changes to the project that are developed aside from the definitive version (e.g. Aunt Maria or Uncle Mile's version of the recipe). A branch or a patch is sent to the maintainers as part of the upstreaming process.

  - Fork - In the video a fork is a permanent split in the project community, with each group taking the project in different directions (e.g. as happened with MySQL and MariaDB).  

    It is important to note that this is a different meaning than a _fork_ in GitHub/GitLab. In GitHub/GitLab a fork most often refers to a personal copy of the upstream repository.  This copy is made as part of the upstreaming process, rather than to split the community and take the project in a different direction. Though, a fork (split) would often begin with a fork (copy).

- **Slides 3-5**

  The discussions around FOSS communities, principles and roles asks students to build out from the Cookie metaphor. They are asked to use their understanding of the general terms (e.g. Transparency, Inclusivity, etc; Leaders, Requestors, etc) to imagine what these terms mean in the context of a FOSS community. Not every term will require clarification following small group discussion. Most commonly the principles of Meritocracy and Release Early and Often, and the distinction between the roles of User, Requestor and Contributor are topics for further clarification. This is also a good point at which to emphasize that a given individual may play different roles at the same time.  For example, Grandma Mae could put forth an idea for an improvement to her recipe as a contributor. Then if the community likes the idea, she may, as a maintainer, integrate it into the upstream main branch.

- **Slides 6-8**

  _Version control_ and _repository hosting_ are defined as collaboration tools and a distinction is drawn between them. A number of different examples of each, e.g. svn/mercurial for version control and GitLab/SourceForge for repository hosting, are mentioned for breadth. This can also help to emphasize that while the GitKit focuses on git and GitHub, that the concepts being covered apply to a broad range of similar tools. While the distinction between version control and repository hosting is a useful one, it is far less clear in practice and this can cause confusion for some students - particularly those with prior git/GitHub experience. For example, most repository hosting services provide access to some aspects of the underlying version control tools for the repositories that they host (e.g. it is possible to create branches and commit changes via the GitHub user interface).

- **Slides 10-15**

  The GitKit uses sequences of diagrams to visualize key concepts and processes related to the use of git and GitHub and the forking workflow. Diagrams in the same style are used throughout all of the GitKit topics. A key to success with the GitKit, for both faculty and students, is understanding these diagrams and being able to connect what they depict to the git / GitHub commands used in the forking workflow.

  The first series of diagrams show the relationship between the three copies of a FOSS project's repository that a developer interacts with (upstream, origin and local). They also illustrate the connection between these three copies and the git and GitHub commands that create them (e.g. fork and clone).  A distinction is also made between _remote_ copies of the repository, those residing in the cloud (e.g. the upstream and origin), and the _local_ copy that resides on the developer's machine. It may be helpful for some students to contrast this with systems like Dropbox or OneDrive where local and remote copies of files are automatically synchronized. 

  The hands-on activities provide detailed instructions for creating a fork in GitHub, starting the KitClient and creating a local clone.  However, if time allows it may be also be helpful to demonstrate these actions in class.

- **Slides 17-20**

  A second series of diagrams introduce a basic workflow that illustrates how upstreaming works. Note that this is not the full forking workflow, as it does not include the use of feature branches and ignores the details of staging and committing changes. The primary purpose of this sequence of diagrams is to illustrate how the concept of upstreaming from the Cookie video is implemented using git/GitHub. Additional details of the forking workflow (branch, edit, stage, commit) are added in the second topic and revisited in the third topic.

- **Slide 21**

  The slides conclude with a short introduction to the idea of an issue tracker and its role in a project. The use of the issue tracker tends to be fairly intuitive and the hands-on activities walk students through some of the details. The hands-on activity has each student claim an issue that is labeled as "Round 1." Note that they claim the issue in this activity, but do not fix it until the next activity. Each of these issues asks them to fix a typo that appears in one of the Markdown (`.md`) files in the root directory of the project.

  If time permits, a live demo looking at the issue tracker in the upstream `GitKit-FarmData2` repository, pointing out the Round1 label and how to tell if an issue has been assigned. Note that several of the issues will have been pre-assigned to whomever deployed the kit.

#### Topic 1 Instructor To-Do List

1. [Deploy the GitKit](#deploying-the-gitkit)) several days before it is needed to ensure that everything is in order.  Remember that each deploy will support up to 32 students. If more than 32 students need to be supported you will need to use multiple deploys.

2. Download the [Activity 1 document](./materials/activities/1-A-CommunityAndCollaboration.docx?raw=true) that will be distributed to students and edit it as follows:
   - Insert the URL of the `GitKit-FarmData2` upstream repo in place of the yellow highlighted text "Place URL of your deployed GitKit repository here!" that appears in the "Forking FarmData2" section.
   - Download the instructions for the KitClient that you would like your students to use:
     - [`KitClient-Linux.docx](./materials/activities/KitClient-Linux.docx?raw=true)
     - [`KitClient-VSCode.docx](./materials/activities/KitClient-VSCode.docx?raw=true)
   - Copy and paste the instructions for installing your chosen KitClient in place of the yellow highlighted text "Insert the contents of either `KitClient-Linux.docx` or `KitClient-VSCode.docx` here." that appears in the "Running the KitClient Environment" section.

#### Topic 1 Activity Notes

The hands-on activity for topic 1 has students perform the following major tasks:
  - Fork the fork the upstream `GitKit-FarmData2` repository into their own GitHub space.
  - Install one of the KitClients.
  - Clone their fork (i.e. their origin) of the `GitKit-FarmData2` repository.
  - Claim a Round1 issue in the issue tracker.

The following are notes on some of the specific questions in the topic 1 hands-on activity:

- **Question 8c** (only if using the Linux KitClient)
  
  If a student experiences difficulties getting the KitClient to start some things to try include: 
  - Ensure that Docker Desktop is installed, is running, and is working correctly by trying the following command:
    ```
    docker run hello-world
    ```
  - If an error related to port `5901` or port `6901` is reported then they likely have multiple copies of the KitClient running.  Use Docker Desktop to stop and delete the unnecessary containers.
  - Use Docker Desktop to delete the `KitClient` container the `gitkitvol` volume and all `kitclient` images.  Then follow the instructions for "Setting up and using the KitClient Linux Environment" again.

- **Question 12b (Linux KitClient) / Question #11b (VSCode KitClient)**
  
  Some students will try to clone the upstream `GitKit-FarmData2` repository instead of their origin repository.  A few may even attempt to clone the real `FarmData2` repository.  The Kit-tty should prevent this and provide a helpful tip.

- **Question 13**
  
  Checking the `origin` remote that is given as the answer to this question will confirm that the student has correctly cloned their origin.  Again, the Kit-tty should prevent them doing this incorrectly, but if somehow it did not catching and correcting this early is important.
  
- **Question 15a**
  
  The answer to this question will reasonably differ depending upon when students complete the exercise.  There are initially 3 issues that are pre-assigned to the user that deployed the GitKit.  Students who complete the exercise early are likely to all identify these issues. As additional students claim issues, other students will identify those claimed issues as well.
  
 - **Question 15b**
   
   The activity instructs students to claim an issue by commenting on it with the very specific phrase "I would like to work on this please!"  If they are the first to do so the issue will be assigned to them and they will receive a personalized message from a one of the community automations in response. If they are not the first to respond, they will also receive a message to that effect and a suggestion to try a different issue.  It is important that they use the exact message given in the assignment, otherwise the community automation will not recognize and respond to the question.

- **Question 19**
  
  Some students will attempt to clone the project that they select while they are inside the `GitKit-FarmData2` repository that they already cloned.  If they do attempt this the Kit-tty should intervene, prevent the action and respond with a helpful message.

### Topic 2: Working Local & Upstreaming

#### Topic 2 Synopsis

This topic focuses on the upstreaming process.  Students learn about feature branches, staging and committing changes, pushing feature branches to their origin repository, and making a pull request. At the end of the hands-on activity each student will have experienced the full forking workflow, resulting in a pull request to the upstream `GitKit-FarmData2` repository for changes that fix the "Round 1" issue that they were assigned.  The "Round 1" issues have been created such that they do not conflict with each other.  Thus, all of the student pull requests should be able to be merged automatically.  The instructor will typically perform these merges as a demonstration at the start of [Topic 3: Staying Synchronized](#topic-3-staying-synchronized).

- **Slide 2**
  
  Reviews the main git / GitHub concepts and vocabulary from Topic 1.  The terms _upstream repository_, _origin repository_, _local repository_, _local_, _remote_, _fork_, and _clone_ should be reviewed so that they begin to be part of the student's working vocabulary.  
  
- **Slide 3**
  
  Reviews the simplified workflow introduced in the previous topic.  It should be re-emphasized that this is a simplified view and that this topic is about "unsimplifying" this view by filling in the details.  The figure on this slide, shows a situation where a contributor has made changes to their local repository that they want to upstream.

- **Slide 4**

  Introduce branches, commits. In the diagrams on these slides, and throughout the remainder of the GitKit, different colors are used as the unique identifier for each commit (e.g. we can talk about the "red" or the "yellow" commit).
  
  This slide introduce a conceptual simplification to think of a commit as a complete copy of all files in the project at that point in time.  While this is not the way that commits actually work, this simplification is easy to understand and is consistent with what students experience. When they switch to a branch they see all of the project files not just the changes in the last commit. It is worth a moment here to to explain that storing a complete copy of the files for each commit would be very inefficient and that it does not work that way in practice.  None the less, this seems to be a useful simplification that is sufficient in many circumstances.

- **Slide 5**

  The rule that they should "only commit to feature branches" is introduced here. Rather than attempting to provide a full explanation of the technical reasons for not committing to the main branch, this rule is based on the following rationale. Any time new work is started it should begin from the definitive version of the project.  This definitive version is contained in the upstream main branch. Now recall, from the first topic, that only the project maintainers have the permissions necessary to change the upstream main branch.  Thus, keeping your copies of the main branch identical to the upstream (i.e. by not committing to it) allows you to start your work from the definitive version. This explanation often elicits the question of what happens when the maintainers change the upstream main branch? That question can be put off as how to keep in synch with the upstream is the focus of the next topic.  

- **Slides 6-7**

  The diagrams used by the GitKit to illustrate git and GitHub concepts are extended to include branches and commits. The convention of using colors as the unique identifier for each commit is also used in these diagrams. In doing so, it is important to emphasize the distinction between the final commit in the _active branch_ and the _local files_. Before any changes are made, the local files can be thought of as a copy of the final commit in the active branch.  This is illustrated by initially having the "dot" in the local files be green, the same color as the final commit in the main branch. 
  
- **Slides 8-9**

  The diagrams here illustrate creating and switching to a feature branch. With multiple branches, the concept of the _active branch_ as the target for future commits becomes important and is introduced here.  Later slides will show the addition of new commits to the _active_ feature branch.

- **Slide 10**

  This diagram illustrates the editing of the local files. The difference between this diagram and the previous one can be easy to miss. The color of the "dot" in the local files changes from green to blue indicating that the files have been edited. The fact that the final commit has remained green can be used here to further emphasize the fact that the final commit and the local files are distinct.
  
- **Slides 11-12**

  The diagrams here illustrate the process of staging changes and then committing them to the active branch.  The notion that a _commit_ should contain a "nameable unit of work" is introduced here.  Additional attention to the idea of "nameable" is given in several of the hands-on activities that have students assess the quality of commit messages.  If time is available when presenting this topic, spending some class time on similar exercises in class would help to clarify that idea.

- **Slides 13-14**

  The diagrams here complete a full cycle of the forking workflow by illustrating the feature branch being pushed to GitHub and a pull request being made.  A point of emphasis here should be that by pushing the branch to GitHub makes the changes that it contains available to the maintainers of the upstream.  This can be another point to draw distinction between version control (git) and repository hosting (GitHub).  Pull requests are a repository hosting feature created to facilitate collaboration by allowing many contributors to work on changes and submit them to the upstream for consideration.

#### Topic 2 Instructor To-Do List

1. Prior to this class period it is not required but may be a good idea to ensure that each student has claimed and been assigned a ticket in the issue tracker.  Some student may have tried to claim an issue but not been assigned it due to a race condition with other students, or they may not have used _exactly_ the right phrase in their comment.  In the latter case, the instructor might reply to the errant comment in the issue tracker and suggest that the student try again.

#### Topic 2 Activity Notes

The hands-on activity for topic 2 has students perform the following major tasks:
- Create a feature branch.
- Switch to the feature branch.
- Edit the local files to fix the issue that they were assigned.
- Stage the changes that they made to the local files.
- Commit the staged changes to their feature branch
- Push their feature branch to their origin on GitHub.
- Make a pull request to the `GitKit-FarmData2` upstream.

The following are notes on some of the specific questions in the topic 2 hands-on activity:

- **Question 2b**

  The date of the most recent commit should be the date on which the GitKit was deployed. The third most recent commit should be authored by "Batese2001" and have the commit message "Summary Table Timing and No Log Messages (#289)."  If a student's answer doe not agree with this, then it is likely that they created their fork, after the presentation of the third Topic.  There is not necessarily a reason for concern for this activity, however this may create issues for future activities.  Each of those activities have instructions for resolving the issues and are noted below in Topic 3 and 4.

- **Question 9a**

  The `git status` command here should show one untracked file with modifications and that file should agree with the file that they identified in question #8a.

- **Question 16**

  This question is a good checkpoint to ensure that they have done things correctly to this point.  The most recent commit in the `git log` output should show that they committed changes to the correct file (i.e. the one from #8a) and that they have used a meaningful commit message.

- **Question 24**

  The instructor can use the link provided here to check the students' pull requests for several points:
  - All of the "Round 1" issues have been created such that the do not conflict.  Thus, every pull request for a "Round 1" issue should be able to be merged automatically.  If a given pull request cannot be merged automatically, a comment can be added to the student's pull request with suggestions on how to correct the issue.
  - Each pull request should contain a line with "Closes #xx" or "Fixes #xx" as per question #23c.  If the student PR does not contain this line, or the line is incorrect (e.g. "Closes#xx"), then a comment can be added to the student's pull request requesting that they add or correct this line.

### Topic 3: Staying Synchronized

#### Topic 3 Synopsis

At the start of this topic, the students will have made pull requests for fixes to the "Round 1" issues that they have claimed.  When these pull requests are merged into the upstream main branch it will contain changes that are not in the student's local and origin main branches.  That is, the student's main branches will be _out of synch_ with the upstream main. This topic deals with how developers synchronize the main branches of their local and origin repositories with the upstream main branch.

The hands-on activity has the students synchronize their main branches. They then find a "Round 2" ticket in the issue tracker and repeat the forking workflow cycle to upstream a fix for it (i.e. branch, edit, stage, commit, push, pull request).  This provides students with additional practice with the skills and concepts introduced in Topic 2. In addition, the PRs that the students create for the "Round 2" issues also set up for [Topic 4](#topic-4-merge-conflicts), which focuses on merge conflicts and how to resolve them. 

- **Slides 2-3**

  A review of the elements of the forking workflow introduced and practiced in Topics 1 and 2.  Steps 3-9 on slide 3 are repeated for each contribution (e.g. bug fix, new feature). The feature branch should be pushed to the origin and the pull request made sooner rather than later, because it makes the changes available to the project maintainers for review and discussion as they are developed.  Some projects will even suggest creating a PR prior to making any changes. Once the PR is created, steps 5-8 can then be repeated for each "nameable unit of work" (i.e. each commit) that is involved in completing the contribution.

- **Slide 4**

  This diagram shows the state at the start of this topic.  The students have make pull requests for their "Round 1" issues, but those PRs have not yet been merged. At this point, the instructor can model the actions of a project maintainer and merge a few of these PR's (see: [the To-Do List below](#topic-3-instructor-to-do-list)).

  In addition to merging a few PRs it is worth also discussion other actions that a maintainer might take at this point, including:
  - Reading the body of the PR to understand what is being proposed.  In practice, if the change is more complex than our "Round 1" issues there would be a longer more detailed description expected. A review of the purpose of the "Closes" or "Fixes" line is also appropriate at this point.
  - Looking at the "diff" in the "Changes" tab to get a quick overview of how the contributor has implemented the proposed changes. A maintainer might insert comments directly in the code to request changes or ask questions.
  - "Pulling" a copy of the branch so that they can:
    - Run the program and observe the behavior of the proposed change.
    - Ensure that the proposed change passes all of the automated tests that the project contains.
  - In practice there may be several rounds of feedback from the maintainers and additional changes by the contributor before a PR is ready to be merged into the upstream main.

- **Slide 5**

  This diagram shows the state just after a maintainer has merged some of the "Round 1" pull requests. The key observation here is that the upstream main branch will contain some commits (e.g. blue, and/or pink, and/or lime) that the main branches in the students' local and origin repositories do not.  That is, the students' copies of the main branch will now be _out of synch_ with the upstream main branch.

- **Slide 6**

  This diagram shows a developer pulling the changes to the main branch from the upstream repository into their local repository and then pushing them to their origin.  This brings their copies of the main branch into synch with the upstream main.  While it is not strictly necessary to push the main branch to the origin it keeps everything _in sync_.

  The diagram shows a _fast forward merge_ meaning that the commits in the upstream main branch can simply be added to the end of the local main branch.  This is possible because the commits added to the upstream all build from the "green" commit AND there have been no changes to the local main.  
  
- **Slide 7**

  This diagram helps to justify the "Only commit to feature branches" rule.  It shows the state that could arise if a developer were to make a commit to their local main branch.  Here there could possibly be a conflict between the "fuchsia" commit and the "lime" commit that was added to the upstream main by a maintainer.  This potential conflict prevents a fast-forward merge.  Thus, by not committing to the local main branch and by using only fast-forward merges to the local main developers can ensure that their copies of the main branch stay _in synch_ with the upstream main.  By doing so, every time they want to create a new feature branch, they will be starting from the most up to date state of the project.

- **Slide 8**

  This diagram shows the state after the developer deletes the feature branch from their local and origin repositories.  The changes that were contained in the feature branch have been merged into the main branch. Thus, there is no need to retain the feature branch and deleting it reduces clutter. For students, deleting their feature branches can feel like deleting their work and thus they may not want to do so.  There is no real harm in them retaining their feature branches. 

  It should be emphasized that they should not delete their feature branches before they have been merged. If a PR is made for a feature branch and that branch is deleted from the developer's origin, then the maintainers will no longer have access to the changes.

This set of materials may be a little short for a 75-minute period. The remaining class time can be used to help students who had difficulties creating a PR, who's PR's cannot be merged automatically or are missing the "Closes" or "Fixes" lines.

#### Topic 3 Instructor To-Do List

1. If time permits, review the students "Round 1 pull requests as they are submitted and comment on any PRs that are missing a description or a "Closes"/"Fixes" line.  Occasionally, a student will also make a PR for an issue that has not been assigned to them, commenting that they should request that the issue be assigned to them as described in Activity 1.

2. Prior to this class review the "Round 1" pull requests. Identify some that are suitable as examples of maintainers merging PRs into the upstream (See: Slide 4 above.)  

3. Demonstrate the activity of a project maintainer by merging a few of the student "Round 1" pull requests (See: Slide 4 above). Merging all of the PRs in a class with more than a few students becomes tedious and it is sufficient to do just a few live.  The remaining PRs can then be merged after introducing Topic 3.

4. Follow up after introducing Topic 3 with any students who have not yet made a "Round 1" PR.

#### Topic 3 Activity Notes

The hands-on activity for topic 3 has students perform the following major tasks:
- Set an upstream remote
- Pull changes from the upstream main into their local main
- Push their local main to their origin.
- Find a "Round 2" ticket in the issue tracker.
- Fix and upstream their fix for their "Round 2" issue using the forking workflow from Topic 2.

The following are notes on some of the specific questions in the topic 3 hands-on activity:

- **Question 3a**

  If a student begins the GitKit activities late they may make their fork and clone after the "Round 1" issues have been merged. This will result in their origin mai branch not being _behind_ the upstream main branch.  The directions in Appendix A of the activity have them reset the `HEAD` of their main branch to the commit before any "Round 1" issues were merged. Once they force push this change to their origin they will then see that their main branch is behind the upstream main.

- **Question 3e**

  It is a good idea to check here that the student's upstream remote point to the correct `GitKit-FaramData2` repository.  The Kit-tty should have caught this error and direct students on the correct way to set the upstream remote. However, some students have accidentally set their upstream to their origin or to the real `FarmData2` repository.

- **Question 9b**
 
  After synchronizing with the upstream, the students go on to find a "Round2" ticket in the issue tracker. There are only 4 "Round2" issues, so multiple students will be working on each one.  This question requests that they comment on the issue they want to work on but should spread themselves across the available "Round 2" issues.

- **Questions 10-12**

  These questions ask the student to use the forking workflow to create a fix for the "Round 2" ticket on which they chose to work. Github will indicate that the PRs created by each student for their "Round 2" issue can be merged automatically.  This is because even though multiple students are working on each "Round 2" issue, none of them will have been merged into the upstream main.

### Topic 4: Merge Conflicts

#### Topic 4 Synopsis

At the start of this topic students will have made pull requests for the "Round 2" issues. Initially GitHub will report that these PRs can be merged automatically. However, the instructor will begin this topic by introducing changes to the upstream main that create merge conflicts with the fixes to each of the "Round 2" issues.  Students will then observe that their PRs go from being able to be merged automatically to containing conflicts. 

Topic 4 then focuses on the resolution of merge conflicts.  The concepts of _merge commits_, _common ancestors_, _best common ancestor_, and _non-conflicting_ and _conflicting_ changes are introduced. The topic then covers the process of merging main into a feature branch, git's _raw conflict information_ and the use of _graphical merge tool_.  The hands-on activity concludes with the students having resolved the merge conflict in their "Round 2" pull request.  Note that these PRs are never merged into the upstream as part of the GitKit activities.

- **Slide 2**

  Another opportunity is taken to review of the steps involved in the forking workflow.  Students typically have a good handle on these steps and how they are ordered when using the forking workflow to upstream changes.

- **Slides 3-4**

  The instructor may merge the PR that creates conflicts with the "Round 2" issues (See the [Instructor To-Do](#topic-4-instructor-to-do-list) below) either before or during class.  Merging during class is the preferred option if time permits.  This allows the instructor to show a few student "Round 2" PRs and that they can currently be merged automatically.  Then merge the PR with the conflicts and look at the PR's again to show that they contain conflicts. Slide 4 can be used to illustrate how the conflicts have arisen.

- **Slide 5**

  Introduces the _merge_ operation and _merge commits_.  At this point, a merge with no conflicts (i.e. like the "Round 1" PRs) is illustrated. This is shown from the project maintainer perspective with the feature branch from a PR being merged into the upstream main branch.  Later this will be reversed when students are merging their copy of the upstream main branch into their feature branch to resolve conflicts (see Slides 19-23).

  Merge commits are shown in the diagram as a colored dot with a ring around them. A merge commit for non-conflicting changes are shown with a white ring around them.  The ring is added to indicate that the meta information about the commit is different than what was contained in the feature branch.  This also records the fact that the changes were merged into main as part of the project history.

- **Slides 9-12** 

  Uses a text based example to introduce the concepts of _common ancestors_ and _best common ancestor_, and then to use those to identify conflicting and non-conflicting changes.  One way to identify these changes is first to compare the feature branch to the best common ancestor and highlight **all** changes in the feature branch.  Then repeat, but compare the main branch to the best common ancestor and highlight **all** differences in the main branch.  Then any lines that are highlighted in both the feature branch and the main branch are conflicting changes. All other highlighted lines are non-conflicting changes.

  Note that in these examples the identification of conflicting changes is simplified to be _line based_.  That is, if a change is found, the entire line is marked as containing a change.  Similarly, if a line is changed in both the feature branch and the main branch, the entire line is marked as a conflict.  The algorithm used by git is more complex than this simplified approach, but the concept is sufficiently the same for the purposes of these activities.

- **Slides 13-16**
  
  Some additional practice exercises with identifying non-conflicting and conflicting changes, and merging the results.  These activities can be done and discussed in small groups during class if time permits. 

- **Slide 17**

  Establishes the basis for how developers (i.e. the students) will resolve merge conflicts.  While a maintainer could resolve the conflict, more typically the developer who submitted the PR will be expected to resolve any merge conflicts in their PR.  
  
- **Slide 18**

  The way that a developer will resolve a merge conflicts is to pull the (conflicting) changes to the upstream main to their local repository. They then merge the main branch into their feature branch. They then push their updated feature branch to their origin, which updates the PR.  By updating the PR the maintainers are now able to review not only the proposed changes but also the way that the merge conflicts were resolved. 

  Note that this is backwards from what was done earlier, where the maintainer was merging the feature branch into the main branch. The rule that developers "only commit to feature branches" can be used as a grounding for why developers do the merge in this direction.

- **Slide 19**
  
  Illustrates in more detail the merge of both non-conflicting and conflicting changes from the main branch into the feature branch. Here the merge commit contains a colored ring instead of a white ring (as it did earlier). The colored ring indicates that the merge commit blends the changes that were contained in its two parent commits.

- **Slide 20**

  Shows the _raw merge conflict_ information that is produced by git when a merge creates a conflict.  This information can be edited manually in any text editor.  However, it is often difficult to identify exactly what changes exist.  This is good motivation for the use of a _graphical merge tool_ that makes it easier to see what changes have been made and where the conflicts exist.

- **Slides 21-23**

  Show the _graphical merge tool_ that is built into VS Code. The hands-on activities have the students use this tool to resolve the conflicts in their PRs for their "Round 2" issues.

- **Slide 24-25**

  Here for review and reference and not much time needs to be spend on these slides.  The final slide collects into one diagram everything that is a part of the forking workflow.  It has a lot going on, but by this point students should be able to make sense of each of the actions that are illustrated.

#### Topic 4 Instructor To-Do List

1. If time permits, monitor the "Round 2" tickets in the issue tracker. There are only 4 "Round 2" issues and thus there will need to be multiple students working on each.  The ticket can be manually assigned to each student that comments on it. If a student uses the the comment from Activity 1, the issue will not be assigned to them automatically if it has already been assigned to someone else.

2. Create, but do not merge, a pull request for the `addRound2Conflicts` branch in the upstream. When merged this branch will create a conflict with each of the changes requested in a `Round2` issue.  Thus, this PR should not be merged until after the students have synchronized with the upstream main.  If it is merged before they synchronize, then they will begin the fix for their "Round 2" issue with the (conflicting) changes already, and thus their fix will not conflict.

3. Just before class, or during class merge the PR for the `addRound2Conflicts` branch. It has been effective to do the merge of the PR for the `addRound2Conflicts` branch live in class (See slides 3-4 above).

#### Topic 4 Activity Notes

The hands-on activity for topic 4 has students perform the following major tasks:
- Synchronize their main branches with the upstream main branch.
  - This brings in the changes that conflict with their "Round 2" fixes.
- Merge the main branch into their feature branch.
- Examine the raw merge conflict information.
- Use the VS Code merge tool to resolve the conflict.
- Commit the merged result to their feature branch.
- Push the feature branch to update their pull request.

In this activity students synchronize with the upstream to get the conflicting changes that were merged by the `addRound2Conflicts` branch. They then merge those changes into their feature branch creating a conflict.  They use a merge tool to resolve the conflict and then push the changes to their origin to update their pull request.  Their goal is to have their pull requests updated so that they again are able to be merged automatically.  There is ultimately no need to merge these pull requests.

- **Question 2(e,f)**
  
  In this exercise there are no conflicting changes and the merge would be able to be completed automatically.  However, if all of the non-conflicting changes are merged into the result the program will not produce the correct result.  The point being that automatic merges can check for structural conflicts, but not logical or semantic conflicts and thus caution should be used when performing merges.

- **Question 6**

  Inevitably some students will be behind on their work and will complete their sync with upstream main after you have merged the PR for the `addRound2Conflicts` branch.  In these cases, their pull requests will not create a conflict to be resolved.  These students should follow the instructions given in Appendix A.  These directions have them pull the `mergeConflictPractice` branch and create a pull request for it.  That branch contains conflicts with those introduced in the `addRound2Conflicts` branch.  So they can then complete the activity using the `mergeConflictPractice` branch as it it were their original feature branch. Students not in this situation, but who would like additional practice can also pull and use the `mergeConflictPractice` branch at the end of the activity.

- **Question 14(a,b)**

  By default, VS Code does not display the best common ancestor in its merge tool. The steps given in these questions has the students change the VS Code configuration such that it includes the best common ancestor.

- **Question 22**

  This question is optional.  If the student did not need to use the `merge-conflict-practice` branch in question #6, then they can use it at this point for additional practice with resolving merge conflicts.

## Acknowledgments

This kit was designed and developed by many people, including:

* [Grant Braught](https://www.dickinson.edu/site/custom_scripts/dc_faculty_profile_index.php?fac=braught)
* [Karl Wurst](http://cs.worcester.edu/kwurst/)
* ["Stoney" Jackson](https://www1.wne.edu/arts-and-sciences/faculty.cfm?uid=203)
* [Clif Kussmaul](https://kussmaul.org/)
* [Cam Macdonell](https://www.macewan.ca/academics/academic-departments/computer-science/academics/capstone-projects/profile/?profileid=macdonellc4)
