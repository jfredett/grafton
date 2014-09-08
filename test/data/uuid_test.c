#include <check.h>
#include "check_grafton.h"
#include "data/uuid.h"
#include <stdio.h>
#include <string.h>

void uuid_test_setup() {

}

void uuid_test_teardown() {

}

START_TEST (get_uuid_should_return_a_uuid) {
  char* uuid = get_uuid();

  ck_assert(strcmp(uuid, "") != 0);
}
END_TEST

START_TEST (get_uuid_should_not_return_the_same_uuid_twice) {
  char* uuid_1 = get_uuid();
  char* uuid_2 = get_uuid();

  ck_assert(strcmp(uuid_1, uuid_2) != 0);
}
END_TEST
