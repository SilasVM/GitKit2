# Instructor Guide for FarmData2 GitKit

The FarmData2 GitKit repository is a disconnected fork of [FarmData2](https://github.com/DickinsonCollege/FarmData2) created for class activities that introduce Free and Open Source Software (FOSS) collaboration models using git and GitHub with a [forking workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow).

## Activities

There is a sequence of 4 activities that cover the following topics:

1. Community and Collaboration: [[Slides](./materials/slides/1-S-CommunityAndCollaboration.pptx?raw=true) | [Activity](./materials/activities/1-A-CommunityAndCollaboration.docx?raw=true)]
   * An introduction to FOSS communities, how they collaborate using version control (e.g. git) and repository hosting (e.g. GitHub).
   * Includes practice with the issue tracker, forking and cloning.
2. Working Local & Upstreaming [[Slides](./materials/slides/2-S-WorkingLocallyAndUpstreaming.pptx?raw=true) | [Activity](./materials/activities/2-A-WorkiongLocallyAndUpstreaming.docx?raw=true)]
   * Introduces feature branches, commits and pull requests as part of a basic branching workflow.
   * Includes practice with creating and switching branches, staging and committing changes, pushing to origin and submitting pull requests.
3. Staying Synchronized [[Slides](./materials/slides/3-S-StayingSynchronized.pptx?raw=true) | [Activity](./materials/activities/3-A-StayingSynchronized.docx?raw=true)]
   * Looks at how asynchronous collaboration results in local repository being out of synch with the upstream and how to resolve this by pulling automatically merged changes.
   * Includes having code merged into upstream main, practice with setting the upstream remote, pulling changes from upstream main, pushing to origin, deleting feature branches.
4. Merge Conflicts [[Slides](./materials/slides/4-S-MergeConflicts.pptx?raw=true) | [Activity](./materials/activities/4-A-MergeConflicts.docx?raw=true)]
   * Introduces conflicting changes, how they lead to merge conflicts, how they can be resolved.
   * Includes practice with merging main into a feature branch, merge conflict representation, using a merge tool and updating a pull request.

### Using this Repository

**Note:** One fork will support up to 26 students. If you have more than 26 students you will need to have multiple repositories.

To set up this repository to use in your class, use the instructions below
to create `https://github.com/<org>/GitKit-FarmData2` repository.
You'll need Docker installed and running.

1. On GitHub, identify or create the organization into which you will deploy
   GitKit. This can be your personal namespace, or it can be any organization
   that you control. You cannot deploy GitKit into the same
   namespace/organization twice. So if you want to redeploy GitKit, delete
   the previous deployment first.

2. On GitHub, create a personal access token with the following scopes
   * repo (all)
   * workflow
   * read:org

3. Run the following replacing `<token>` with the token you just created,
   and `<org>` with the URL to the GitHub organization (or username) to deploy
   into.

      ```bash
      docker run --rm -it -e GH_TOKEN=<token> registry.gitlab.com/hfossedu/kits/gitkit:latest <org>
      ```

   For example, the following deploys the GitKit into the `wne-cs220-s2023`
   organization.

      ```bash
      docker run --rm -it -e GH_TOKEN==ghp_QWERTYasdf1234POIUljhxcvb registry.gitlab.com/hfossedu/kits/gitkit:latest https://github.com/wne-cs220-s2023
      ```


#### Community and Collaboration

In this activity students will fork and clone the repository and will claim a `Round1` issue in the issue tracker.  The activity instructs students to claim an issue by commenting on it and that issues will be assigned to the first student to comment on each issue.  The instructor should assign issues to the student in the issue tracker.  There are enough `Round1` issues for 26 students.

#### Working Local & Upstreaming

In this activity students will make changes to address the issue that they were assigned. They will then make a pull request to the upstream (i.e. your fork).  All of the `Round1` issues have been selected so as not to create any conflicts.  Thus, the students will see that their pull requests can be merged automatically. The pull requests can be merged as they come in, but it has been an effective demonstration to merge them in class when this assignment is complete.

#### Staying Synchronized ####

After the pull requests from the prior assignment have been merged, the `main` branches in the students' local and origin repositories will be out of synch with the upstream `main`.  They will pull the changes from upstream `main` and, if all goes well, they will be fast-forward merged.  They will then push the their local `main` branch, with the updates, to their origin.  This brings the `main` branches of their repositories into synch with the upstream.

After synchronizing with the upstream, the students go on to claim an `Round2` issue in the issue tracker.  There are only 4 `Round2` issues, so multiple students will be working on each one.

At the point when most or all students have synchronized with the upstream, make a pull request for the `addRound2Conflicts` branch in your fork and merge it. This branch creates conflicts with each of the changes requested in a `Round2` issue.  So, when the students ultimately create a pull request for their `Round2` issue it will not be able to be merged automatically.

It has also been effective to wait to merged the `addRound2Conflicts` branch at the start of the next class meeting. In that case all student will see that their pull request can be merged automatically when they create it.  However, once the `addRound2Conflicts` branch is merged they will all change to not being able to be merged automatically.  Doing this in class allowed for the concurrent changes made by the pull request to be illustrated live.

#### Merge Conflicts

In this activity students synchronize with the upstream to get the conflicting changes that were merged by the `addRound2Conflicts` branch. They then merge those changes into their feature branch creating a conflict.  They use a merge tool to resolve the conflict and then push the changes to their origin to update their pull request.  Their goal is to have their pull requests updated so that they again are able to be merged automatically.  There is ultimately no need to merge these pull requests.

Inevitably some students will be behind on their work and will complete their sync with upstream after you have merged the `addRound2Conflicts` branch.  In these cases, their pull requests will not create a conflict to be resolved.  These students should pull the `mergeConflictPractice` branch and create a pull request for it.  That branch contains conflicts with those introduced in the `addRound2Conflicts` branch.  So they can then complete the activity using the `mergeConflictPractice` branch as it it were their original feature branch. Students not in this situation, but who would like additional practice can also pull and use the `mergeConflictPractice` branch.

## Acknowledgments

This kit was designed and developed by several people.

* [Grant Braught](https://www.dickinson.edu/site/custom_scripts/dc_faculty_profile_index.php?fac=braught)
* [Karl Wurst](http://cs.worcester.edu/kwurst/)
* ["Stoney" Jackson](https://www1.wne.edu/arts-and-sciences/faculty.cfm?uid=203)
* [Clif Kussmaul](https://kussmaul.org/)
* [Cam Macdonell](https://www.macewan.ca/academics/academic-departments/computer-science/academics/capstone-projects/profile/?profileid=macdonellc4)
