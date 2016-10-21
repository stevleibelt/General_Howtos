# code review / peer review

## what are the main purposes

* code as sufficient quality to be released
    * following the guideline
    * not over engineered
    * readable and simple to understand (KISS, DRY, divide and conquer etc.)
    * bad structure or not used code
* teaching each other how and when use dedicated tools to improve
    * code quality
    * consistency
    * maintainability

## what can this contain?

* code inspection
* code reading
* code walkthrough
* peer desk checks
* ...

## general mindset

* it is not the place where we have to demonstrate who the better programmer is
* it is a forum to discuss and learn from eachother

## do's and don'ts

### for the one doing the code review

* stay focused on the code, not on the developer
* there are always more than one way to solve a solution it is ok as long as
    * it has a good quality
    * fullfils the requirements
    * is maintainable
    * meets the coding standards
* ask questions instead of making statements
    * "what was the reasoning behind this approach?"
    * there is no wrong in the world anyways, there is a "we have a different oppinion" at maximum
* avoid the "why" question
    * "what was the reason you ... "
    * why is a mood changer, in general no to the best side
* praise good things
    * everyone is searching for success (even you! :-))
    * if something is good, tell this
    * if something is smart, tell this
    * if something is great, tell this
* refer to the good coding standards you have
    * they are shared aagreements from the developer, everyone should say yes without any problems
    * they are not hammerd in stone
    * discuss why and if the found code should be in the coding standard or not

### for the ones code which has been reviews

* you are not your code
    * try to prevent getting pissed or beeing defensive
    * ask questions if you do not understand
* fix issues based on a checklist
* ask to get a prioritized list to determine what is most imporant

## example notes templates for doing a code review

```
# header

branch name:
latest commit id:
branch to compare with:
   git diff <tag or branch> > diff_from_<tag or branch>_to_<branch name>

# notes

## summary

<positive since this is setting the mood of the developer (thrilled, thankful, happy etc.)>.

## general

* <what I liked about your taken aproach>
* <I have problems to understand the reason>

## directly in the code

* <full qualified class name or file path>
    * <...>

```

## best pratices

* review less than 500 lines of code at one time
* inspection rates should be below 500 lines of code per hour
* do not review more than 60 minutes at once
* set goals and caputre mretirs (inspection rate, defect rate, defect density)
* annotate source code before the review
* use checklists
* establish a process for fixing defects
* support a positive code review culture
* practice lightweight code reviews

# links

* https://blog.codinghorror.com/code-reviews-just-do-it/
* http://www.developer.com/tech/article.php/3579756/Effective-Code-Reviews-Without-the-Pain.htm
* https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/
