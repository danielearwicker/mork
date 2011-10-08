#include <shared1.hpp>
#include <shared2.hpp>

#include <iostream>

int main()
{
	std::cout << std::endl 
		<< "-----" << std::endl 
		<< shared1_concat("Message from shared1: ") << std::endl
		<< shared2_message() << std::endl
		<< "-----" << std::endl 
		<< std::endl;
}

