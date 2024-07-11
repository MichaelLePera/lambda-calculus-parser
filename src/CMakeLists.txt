

add_executable (lambda-calculus-parser
    "main.cc"
)


add_compile_options(lambda-calculus-parser "-std=c++23")

set_property(TARGET lambda-calculus-parser PROPERTY CXX_STANDARD 23)

