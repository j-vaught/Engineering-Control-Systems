PYTHON ?= python3
FIGURE_PIPELINE := scripts/figure_pipeline.py

.PHONY: figure figure-specimens figures check-figures figure-review test-figures test

figure:
	@if [ -z "$(FIGURE)" ]; then \
		echo "error: FIGURE is required (for example: make figure FIGURE=tests/specimens/diagram)"; \
		exit 2; \
	fi
	$(PYTHON) $(FIGURE_PIPELINE) figure --figure "$(FIGURE)"

figure-specimens:
	$(PYTHON) $(FIGURE_PIPELINE) figure-specimens

figures:
	$(PYTHON) $(FIGURE_PIPELINE) figures

check-figures:
	$(PYTHON) $(FIGURE_PIPELINE) check-figures

figure-review:
	$(PYTHON) $(FIGURE_PIPELINE) figure-review

test-figures:
	$(PYTHON) $(FIGURE_PIPELINE) test-figures

test:
	$(PYTHON) $(FIGURE_PIPELINE) test
