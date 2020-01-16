#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <dirent.h>
#include <strings.h>
#include <string.h>
#include <unistd.h>
#include <stdarg.h>
#include <getopt.h>
#include <regex.h>
#include <errno.h>

#define MAX_SLABS 10

struct slabinfo {
        char *name;
        int aliases;
        unsigned long partial;
        unsigned int object_size;
}slabinfo[MAX_SLABS];

int show_alias;
int slabs;

char buffer[4096];

static void fatal(const char *x, ...)
{
	va_list ap;

	va_start(ap, x);
	vfprintf(stderr, x, ap);
	va_end(ap);
	exit(EXIT_FAILURE);
}

static unsigned long read_obj(const char *name)
{
	FILE *f = fopen(name, "r");

	if (!f)
		buffer[0] = 0;
	else {
		if (!fgets(buffer, sizeof(buffer), f))
			buffer[0] = 0;
		fclose(f);
		if (buffer[strlen(buffer)] == '\n')
			buffer[strlen(buffer)] = 0;
	}
	return strlen(buffer);
}

static void slabcache(struct slabinfo *s)
{
	if (strcmp(s->name, "*") == 0)
		return;

        printf("%-21s %8d", s->name, s->aliases);
               
}

static void output_slabs(void)
{
	struct slabinfo *slab;

	for (slab = slabinfo; (slab < slabinfo + slabs); slab++) {
                slabcache(slab);
	}
}

struct option opts[] = {
	{ "aliases", no_argument, NULL, 'a' },
	{ NULL, 0, NULL, 0 }
};
        
int main(int argc, char *argv[])
{
	int c;

	while ((c = getopt_long(argc, argv, "a", opts, NULL)) != -1)
		switch (c) {
		case 'a':
			show_alias = 1;
			break;
		default:
			fatal("%s: Invalid option '%c'\n", argv[0], optopt);

	}
        
        output_slabs();

	return 0;
}
