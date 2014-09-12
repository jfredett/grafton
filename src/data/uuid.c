#include <uuid/uuid.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "data/uuid.h"

uuid* get_uuid(void) {
  uuid_t uuid_raw;
  // uuid_unparse generates a 37 byte string w/ the \0 at the end
  char* uuid_string = malloc(sizeof(char) * 37);

  uuid_generate(uuid_raw);
  uuid_unparse(uuid_raw, uuid_string);

  uuid* u = malloc(sizeof(uuid));
  u->string = uuid_string;

  return u;
}

bool uuid_null(uuid* a) {
  return strcmp(a->string, "") == 0;
}

bool uuid_cmp(uuid* a, uuid* b) {
  return strcmp(a->string, b->string);
}

void free_uuid(uuid* a) {
  free(a->string);
  free(a);
}
