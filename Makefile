#!make -f

CXX=clang++-9 
CXXFLAGS=-std=c++2a

run: demo
	./$^

demo: Demo.o Gimatriya.o
	$(CXX) $(CXXFLAGS) $^ -o demo

test: TestCounter.o Test.o Gimatriya.o
	$(CXX) $(CXXFLAGS) $^ -o test

%.o: %.cpp Gimatriya.hpp
	$(CXX) $(CXXFLAGS) --compile $< -o $@

clean:
	rm -f *.o demo test
