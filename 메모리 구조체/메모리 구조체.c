#include <stdio.h>
#define _CRT_SECURE_NO_WARNINGS
#define SIZE 5

int main() {
	struct employee_info {
		char name[12];
		char id[10];
		int salary;
	};
	struct employee_info employee[SIZE];
	int average = 0;
	int sum = 0;
	int i;
	printf(">>직원의 정보(이름,ID,급여)를 입력하세요<<\n");

	for (i = 0; i < SIZE; i++) {
		printf("%d번:", i + 1);
		scanf("%s%s%d", employee[i].name, employee[i].id, &employee[i].salary);
		sum += employee[i].salary;
	}
	average = sum / SIZE;
	printf("\n-----------------\n");
	printf("급여가 %d만원(평균) 이상인 직원 정보", average);
	printf("\n-----------------\n");
	
	for (i = 0; i < SIZE; i++) {
		if (employee[i].salary >= average) {
			printf("\t%s\t%d만원\n", employee[i].id, employee[i].salary);
		}
	}
	printf("------------------\n");
	return 0;
}
