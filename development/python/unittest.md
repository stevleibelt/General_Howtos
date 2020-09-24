# unit tests in python

Pythons `unittest` supports following concepts:

* test fixture
* test case
* test suite
* test runner

# example directory structure

```
my_module/  #svc repository root
    LICENCE.md
    my_module/  #package root
        foo/
            bar.py
        io.py
        _version.py
    README.md
    requirements.txt
    requirements-dev.txt
    tests/
        foo/
            test_bar.py
        testdata/
        test_io.py
```

# unittest example

```
#execute a singe test file
python -m unittest <path to the test file> [-v]

#try to discover all test files
python -m unittest discover <path to the project> -p "*_test.py"
```
Execute a test with `python -m unittest <path to the test file > [-v]`.

```
import unittest

class TestStringMethods(unittest.TestCase):

    def setUpClass(self):
        print("set up class")

    def setUp(self):
        print("set up")

    def tearDown(self):
        print("tear down")

    def tearDownClass(self):
        print("tear down class")

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')

    def test_isupper(self):
        self.assertTrue('FOO'.isupper())
        self.assertFalse('Foo'.isupper())

    def test_split(self):
        string = 'hello world'
        self.assertEqual(string.split(), ['hello', 'world'])
        #check that string.split fails when the separator is not a string
        with self.assertRaises(TypeError):
            string.split(2)

    @unittest.expectedFailure
    def test_to_dail(self):
        self.assertEqual(1, 0, "broken")

    @unittest.skip("showcase general skipping feature")
    def test_skip_always(self):
        self.fail("TSNH")

    @unittest.skipIf(mylib.__version__ < (1, 3), "skpping test for older version")
    def test_skip_on_old_version(self):
        pass

    @unittest.skipUnless(sys.platform.startswith("win"), "skip test unless the test is executed on windows")
    def test_skip_if_not_windows(self):
        pass

    def test_maybe_skipped(self):
        if not external_resource_is_available():
            self.skipTest("external resource not available")
        pass

    def test_subtest_even(self):
        """
        test a function with a number of data set
        """
        for iterator in range(0, 6):
            with self.subTest(iterator=iterator):
                self.assertEqual(iterator % 2, 0)

if __name__ == '__main__':
    unittest.main()
```

# test suite example

```
import unittest

def suite():
    suite = unittest.TestSuite()
    suite.addTest(MyTestCase('test_this_method'))
    suite.addTest(MyTestCase('test_that_method'))
    return suite

if __name__ == '__main__':
    runner = unittest.TextTestRunner()
    runner.run(suite())
```

# links

* [structuring unit tests in python](https://medium.com/python-in-plain-english/unit-testing-in-python-structure-57acd51da923) - 20200725
* [unittest documetation from python.org](https://docs.python.org/3/library/unittest.html) - 20200924
