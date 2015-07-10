GRAMMAR = $(shell echo *.pgx)
export PERL5LIB=../pegex-pm/lib
COMPILE_COMMAND = pegex compile $(OPTIONS) --to=
ALL = $(GRAMMAR:%=%.yaml) $(GRAMMAR:%=%.json)

export PEGEX_COMBINATE_RULES = document text_markup block_list_item

all: $(ALL)

$(ALL): $(GRAMMAR) Makefile
	$(COMPILE_COMMAND)$(shell perl -e '$$_="$@";s/.*\.//;print') $(shell perl -e '$$_="$@";s/\.\w+$$//;print') > $@

clean purge:
	rm -f *.yaml *.json
