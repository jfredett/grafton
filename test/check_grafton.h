#define START_TEST_SUITE(name, desc) \
  void add_##name(Suite* parent_suite) { \
    TCase *tc = tcase_create(desc);

#define END_TEST_SUITE \
  suite_add_tcase(parent_suite, tc); \
  }

#define FIXTURE(up, down) \
  tcase_add_checked_fixture(tc, up, down);

#define TEST(function) \
  tcase_add_test(tc , function);

#define TEST_MAIN \
  int main(void) { \
    int number_failed; \
    Suite *s = suite_create("grafton"); \

#define SUITE(suite_name) \
  add_##suite_name(s);

#define END_TEST_MAIN                                         \
  SRunner *sr = srunner_create(s);                            \
  srunner_run_all(sr, CK_NORMAL);                             \
  number_failed = srunner_ntests_failed(sr);                  \
  srunner_free(sr);                                           \
  return (number_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;  \
}
