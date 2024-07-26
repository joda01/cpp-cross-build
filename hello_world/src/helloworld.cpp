#include <iostream>


int main(int argc, char *argv[])
{
    std::cout << "Hello worls" << std::endl;

    return 0;
}

// clang++ --sysroot=/workspaces/clang/sdks/linux/musl-1.2.5-install --target=x86_64-unknown-linux-musl  --stdlib=libc++  -c src/main.cpp -o src/main.o


