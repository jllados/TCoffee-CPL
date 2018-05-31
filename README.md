TCoffee v.11 with Clustering Pairwise Library reduction
TCoffee-CPL
=========
T-Coffee is a collection of tools for Computing, Evaluating and Manipulating 
Multiple Alignments of DNA, RNA, Protein Sequences and Structures.


Prerequisites
--------------
T-Coffee compilation requires the following tools installed on your system ``make`` and ``gcc-c++``.

The execution requires ``R`` with ``Rscript`` in the $PATH and the ``CTC`` package. 


Compile 
--------
Download the git repository on your computer.
    
Make sure you have installed the required dependencies listed above. 
When done, move in the project root folder and enter the following commands:     
    
    $ cd src
    $ make
    

The binary will be automatically generated in the folder.


Example
--------

It is included a script named ``run_example`` which executes t_coffee with the required parameters.
The example uses the ``BB11001`` dataset from ``BAliBASE``.
