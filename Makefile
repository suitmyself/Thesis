# vim:ts=4:sw=4
#
# Copyright (c) 2008-2009 solvethis
# Copyright (c) 2010-2012 Casper Ti. Vector
# Public domain.

# ����������ļ����ļ�������������չ����
JOBNAME = thesis
# ���������ֵ����Ϊ latex��pdflatex �� xelatex��
LATEX = latex
# ����޷�ʹ�� biber�����Ը�Ϊ��bibtex����
BIBTEX = biber -l zh__pinyin
DVIPDF = dvipdfmx

# ����� LaTeX ���룬��ʹ�� dvipdfmx �� dvi ת�� pdf��
ifeq ($(LATEX), latex)
	DODVIPDF = $(DVIPDF) $(JOBNAME)
endif

# ������ Windows ���������� UNIX ������
# ����Ǻ��ߣ��� GNU make �����Լ�⵽�Ѿ����� PATH ����������
ifdef PATH
	MAKE = make
	RM = rm -f
else
	MAKE = mingw32-make
	RM = del
endif

doc:
	$(LATEX) $(JOBNAME)
	$(BIBTEX) $(JOBNAME)
	$(LATEX) $(JOBNAME)
	$(LATEX) $(JOBNAME)
	$(DODVIPDF)

clean:
	$(RM) $(JOBNAME).{aux,bbl,bcf,blg,dvi,lof,log,lot,run.xml,toc,out{,.bak}} \
		{missfont,texput}.log chap/*.aux

distclean: clean
	$(RM) $(JOBNAME).pdf

