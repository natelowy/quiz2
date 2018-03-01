all: build doczip

clean:
	-rm -r *.o .class a.out myexe html latex doc.tar.gz

build: myexe

doczip: doc
	tar cvzf doc.tar.gz html/ latex/

doc: collegemain.cc course.cc college.cc course.h college.h node.h
	doxygen .

myexe: college.o collegemain.o course.o
	g++ -o myexe college.o collegemain.o course.o

college.o: college.cc college.h
	g++ -c college.cc

collegemain.o: collegemain.cc course.h college.h node.h
	g++ -c collegemain.cc

course.o: course.cc course.h
	g++ -c course.cc