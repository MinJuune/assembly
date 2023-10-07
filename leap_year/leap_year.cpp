#include <stdio.h>

int main() {
	int year;

	while (1) {
		printf("년도를 입력하세요(종료:음수)");
		scanf_s("%d", &year);

		if (year < 0) {
			return 0;
		}

		else if (year % 400 == 0) {
			printf("%d 윤년입니다.\n", year);
		}

		else if (year % 100 == 0) {
			printf("%d 평년입니다.\n", year);
		}

		else if (year % 4 == 0) {
			printf("%d 윤년입니다.\n", year);
		}


		else {
			printf("%d 평년입니다.\n", year);
		}
	}
}

