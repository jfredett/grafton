#include <stdbool.h>

typedef struct _uuid {
  // uuid_unparse generates a 37 byte string w/ the \0 at the end
  char* string;
} uuid;

uuid* get_uuid(void);
bool uuid_cmp(uuid* a, uuid* b);
bool uuid_null(uuid* a);
