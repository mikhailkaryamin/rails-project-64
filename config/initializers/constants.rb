# frozen_string_literal: true

ALLOWED_BOOTSTRAP_ATTRIBUTES = %w[data-bs-target data-bs-toggle].freeze
ALLOWED_ATTRIBUTES = Loofah::HTML5::SafeList::ALLOWED_ATTRIBUTES.merge(ALLOWED_BOOTSTRAP_ATTRIBUTES)
ALLOWED_ELEMENTS = Loofah::HTML5::SafeList::ALLOWED_ELEMENTS
