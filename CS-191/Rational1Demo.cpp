/*
Write a single file program to prototype, define and then test a class for rational numbers.
Recall that a rational number is a number in the form a/b, where a, b are integers and b is not 0. Examples: 2/3, -8/5, 0/20
*/
#include <iostream>
using namespace std;

//class == c++ way to represent objects
class Rational {
private:
	int num, den;
public:
	Rational(); //build default rational number (constructor because same name as class) (default constructor == providing no info)
	Rational(int, int); //If returning something, not a constructor
	void display(); //display function (doesn't return anything)
	void load(); //^^All prototyped in class
	void add(Rational); //Rational datatype

};

Rational::Rational() { //Constructor
	num = 0;
	den = 1; //Not 0; Valid because not division by 0
}

Rational::Rational(int n, int d) { // Constructor
	num = n;
	den = d;
}

void Rational::display() { //void because this is a function, which returns something. (Unlike constructors)
	cout << num << "/" << den << endl;
}

void Rational::load() {
	cout << "Enter numerator and denominator: ";
	cin >> num >> den;
}

void Rational::add(Rational r) { //define rational (r) here
	num = num * r.den + den * r.num;
	den = den * r.den;
}


int main() {
	Rational r1 = Rational();
	Rational r2 = Rational(3, 5);
	r1.display();
	r2.display();

	r1.load();
	r1.add(r2);
	r1.display();
}