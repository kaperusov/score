# My music notebook

Here I collected a few simple exercises that I needed 
in the process of learning to play the guitar and 
something just for myself.

# make pdf from lytex file
Use bash script:

	sh lytex2pdf <file_name.lytex>

Or manual, type commands:

	lilypond-book --pdf <file_name.lytex>
	latex <file_name.tex>
	dvipdf -dNOSAFER <file_name.dvi>
