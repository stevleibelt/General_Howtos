/*
 * @author artodeto <artodeto@bazzline.net>
 * @since 2014-02-22
 */

#include <iostream>
#include <random>
using namespace std;

int main() {
    random_device rn;
    mt19937 engine(rn());
    uniform_int_distribution<int> dice(7, 42);

    cout << "13 random numbers" << endl;
    cout << "--------" << endl;
    cout << endl;
    for(auto iterator=0; iterator<13; ++iterator) {
        cout << dice(engine) << endl;
    }

    return 0;
}
