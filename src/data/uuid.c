#include <uuid/uuid.h>
#include "data/uuid.h"
#include <stdlib.h>

char* get_uuid(void) {
  uuid_t uuid_raw;
  // uuid_unparse generates a 37 byte string w/ the \0 at the end
  char* uuid = malloc(sizeof(char) * 37);

  uuid_generate(uuid_raw);
  uuid_unparse(uuid_raw, uuid);

  return uuid;
}
