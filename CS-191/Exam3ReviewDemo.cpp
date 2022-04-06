//Exam 3 General Review and Demo

#include <iostream>
#include <string>
using namespace std;

void printarray(int arg[], int length) {
    for (int n = 0; n < length; ++n)
        cout << arg[n] << ' ';
    cout << '\n';
}

int factorialRec(int n) {
    if (n == 0 || n == 1)
        return 1;
    else
        return n * factorialRec(n - 1);
}

int power(int b, int p) {
    if (p == 0)
        return 1;
    else
        return b * power(b, p - 1);
}

struct test {
    int x, y;

};

class testClass {
public:
    int testNum;
    string testString;
};

int main() {
    int n, b, p;
    struct test p1;

    //printarray test
    int arraytest[] = { 5, 10, 15, 20, 50 };

    //factorialRec test
    cout << "enter a positive integer: " << endl;
    cin >> n;

    //power of a number test
    cout << "enter two positive integer: " << endl;
    cin >> b >> p;

    //struct number assignment test
    cout << "enter value for x: " << endl;
    cin >> p1.x;
    cout << "enter value for y: " << endl;
    cin >> p1.y;

    //class and object test
    testClass testObj;  // create an object of testClass
    testObj.testNum = 15;
    testObj.testString = "obj string";
    
    //Printing Results
    cout << " " << endl << endl;
    cout << "Results: " << endl << endl;
    cout << "_______________" << endl << endl;

    cout << "Factorial: " << factorialRec(n) << endl << endl;

    cout << b << "^" << p << " = " << power(b, p) << endl << endl;

    cout << "x = " << p1.x << " " << "y = " << p1.y << endl << endl;

    cout << "Array: ";
    printarray(arraytest, 5);
    cout << endl << endl;

    cout << "number test: " << testObj.testNum << "\n";
    cout << "string test: " << testObj.testString;
    cout << endl << endl;
    return 0;
}