A program that generates Mad Libs paragraphs from template files.

To support producing an arbitrary number of Mad Libs stories. First, add a new variable named var.num_files having type number and a default value of 100. Next, reference this variable to dynamically set the count meta argument on each of the shuffle_resources.

The element() function operates on a list as if it were circular, retrieving elements at a given index without throwing an out-of-bounds exception. This means element() will evenly divide the 100 Mad Libs stories between the two template files.

The count.index expression references the current index of a resource.