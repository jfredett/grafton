#include <check.h>
#include <stdio.h>
#include <string.h>

#include "check_grafton.h"

#include "data/uuid.h"

void uuid_test_setup() { }
void uuid_test_teardown() { }


START_TEST (get_uuid_should_return_a_uuid) {
  uuid* uuid = get_uuid();

  ck_assert(!uuid_null(uuid));
}
END_TEST

START_TEST (get_uuid_should_not_return_the_same_uuid_twice) {
  uuid* uuid_1 = get_uuid();
  uuid* uuid_2 = get_uuid();

  ck_assert(uuid_cmp(uuid_1, uuid_2));
}
END_TEST
