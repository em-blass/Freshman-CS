/*
    Emmet Blassingame
    CS191
    Rational1
    main.cpp
*/

#include <iostream>
using namespace std;

class Rational {
private:
    int numerator;
    int denominator;

    //Load function
    void load() {
        cout << "Enter Num / Den: ";
        cin >> numerator >> denominator;
    }

    // Display function
    void display() {
        cout << "Numerator: " << this->numerator << "  Denominator: " << this->denominator << endl;
    }

public:
    Rational() {
        this->numerator = 1;
        this->denominator = 1;
    }

    Rational(int num, int den) {
        this->numerator = num;
        this->denominator = den;
    }

    void set(int num, int den) {
        this->numerator = num;
        this->denominator = den;
    }

    // Get denominator
    int getDen() {
        return this->denominator;
    }

    // Get numerator
    int getNum() {
        return this->numerator;
    }

    // Double value of rational
    double getApprox() {
        return (double)this->numerator / (double)this->denominator;
    }

    // Add rational
    void add(Rational r) {
        int n = (this->numerator) * (r.denominator) + (r.numerator) * (this->denominator);
        int d = (this->denominator) * (r.denominator);

        this->set(n, d);
        return;
    }
    // Subtract rational
    void sub(Rational r) {
        int n = (this->numerator) * (r.denominator) - (r.numerator) * (this->denominator);
        int d = (this->denominator) * (r.denominator);

        this->set(n, d);
        return;
    }

    // Multiply rational
    void mult(Rational r) {
        int n = (this->numerator) * (r.numerator);
        int d = (this->denominator) * (r.denominator);

        this->set(n, d);
        return;
    }

    // Divide rational
    void div(Rational r) {
        int n = (this->numerator) * (r.denominator);
        int d = (this->denominator) * (r.numerator);

        this->set(n, d);
        return;
    }

    // Friend class
    friend Rational add(Rational, Rational);
    friend bool equal(Rational, Rational);


};

// Add two rationals
Rational add(Rational r1, Rational r2) {
    Rational res;
    int n = (r1.numerator) * (r2.denominator) + (r2.numerator) * (r1.denominator);
    int d = (r1.denominator) * (r2.denominator);

    res.set(n, d);
    return res;

}

// Check if rationals are equal or not
bool equal(Rational r1, Rational r2) {
    return (r1.numerator * r2.denominator == r2.numerator * r1.denominator);
}


int main() {
    Rational r1(2, 3);
    Rational r2(-8, 5);
    Rational r3(0, 20);

    cout << r1.getNum() << endl << endl;
    cout << r2.getDen() << endl << endl;

    cout << r3.getApprox() << endl << endl;

    r1.add(r2);
    cout << r1.getNum() << " " << r1.getDen() << endl << endl;

    r1.sub(r3);
    cout << r1.getNum() << " " << r1.getDen() << endl << endl;

    r1.mult(r1);
    cout << r1.getNum() << " " << r1.getDen() << endl << endl;

    r1.div(r1);
    cout << r1.getNum() << " " << r1.getDen() << endl << endl;

    Rational r4 = add(r1, r2);
    cout << r4.getNum() << " " << r4.getDen() << endl << endl;

    cout << equal(r1, r2) << endl;

}