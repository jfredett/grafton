#include <stdio.h>
#include "data/uuid.h"

int main() {
  printf("hello world\n");
  uuid* uuid = get_uuid();
  printf("uuid: %s\n", uuid->string);
  free_uuid(uuid);
  return 0;
}
