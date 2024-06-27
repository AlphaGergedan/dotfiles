local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- GO

ls.add_snippets('go', {
  s('iferr', {
    t('if err != nil {'),
    t({ '', '  ' }), i(0),
    t({ '', '}' }),
  })
})

ls.add_snippets('go', {
  s('packagemain', {
    t('package main'),
    t({'', ''}),
    t({'', ''}),
    t('import "fmt"'),
    t({'', ''}),
    t({'', ''}),
    t({'', ''}),
    t('func main() {'),
    t({'', ''}),
    t({'', ''}),
    i(0),
    t({'', ''}),
    t({'', ''}),
    t('}'),
  })
})

ls.add_snippets('go', {
  s('funccheck', {
    t('func check(e error) {'),
    t({'', ''}),
    t('  if e != nil {'),
    t({'', ''}),
    t('    panic(e)'),
    t({'', ''}),
    t('  }'),
    t({'', ''}),
    t('}'),
    t({'', ''}),
  })
})

-- MAKEFILE

ls.add_snippets('make', {
  s('CXX', {
    t('CXX ?= g++'),
    t({'', ''}),
    t('CXXFLAGS += -Wall -Werror -Wextra'),
    t({'', ''}),
    t('LDFLAGS='),
    t({'', ''}),
    t({'', ''}),
    t('SRC := main.cc'),
    t({'', ''}),
    t('OBJ := main.o'),
    t({'', ''}),
    t('TARGET := target'),
    t({'', ''}),
    t({'', ''}),
    t('ifeq ($(CXX),clang++)'),
    t({'', ''}),
    t('  LDFLAGS += -stdlib=libstdc++'),
    t({'', ''}),
    t('endif'),
    t({'', ''}),
    t({'', ''}),
    t('ifeq ($(DEBUG),yes)'),
    t({'', ''}),
    t('  CXXFLAGS += -g'),
    t({'', ''}),
    t('endif'),
    t({'', ''}),
    t({'', ''}),
    t('all: $(TARGET)'),
    t({'', ''}),
    t({'', ''}),
    t('$(TARGET): $(OBJ)'),
    t({'', ''}),
    t('  $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $^'),
    t({'', ''}),
    t({'', ''}),
    t('$(OBJ): $(SRC)'),
    t({'', ''}),
    t('  $(CXX) -c -o $@ $(CXXFLAGS) $^'),
    t({'', ''}),
    t({'', ''}),
    t('clean:'),
    t({'', ''}),
    t('  rm -f $(OBJ) $(TARGET)'),
  })
})

-- TODO
ls.add_snippets('make', {
  s('competprog', {
    t('CXX ?= g++'),
    t({'', ''}),
    t('CXXFLAGS += -Wall -Werror -Wextra'),
    t({'', ''}),
    t('LDFLAGS='),
    t({'', ''}),
    t({'', ''}),
    t('SRC := main.cc'),
    t({'', ''}),
    t('OBJ := main.o'),
    t({'', ''}),
    t('TARGET := target'),
    t({'', ''}),
    t({'', ''}),
    t('ifeq ($(CXX),clang++)'),
    t({'', ''}),
    t('  LDFLAGS += -stdlib=libstdc++'),
    t({'', ''}),
    t('endif'),
    t({'', ''}),
    t({'', ''}),
    t('ifeq ($(DEBUG),yes)'),
    t({'', ''}),
    t('  CXXFLAGS += -g'),
    t({'', ''}),
    t('endif'),
    t({'', ''}),
    t({'', ''}),
    t('all: $(TARGET)'),
    t({'', ''}),
    t({'', ''}),
    t('$(TARGET): $(OBJ)'),
    t({'', ''}),
    t('  $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $^'),
    t({'', ''}),
    t({'', ''}),
    t('$(OBJ): $(SRC)'),
    t({'', ''}),
    t('  $(CXX) -c -o $@ $(CXXFLAGS) $^'),
    t({'', ''}),
    t({'', ''}),
    t('clean:'),
    t({'', ''}),
    t('  rm -f $(OBJ) $(TARGET)'),
  })
})

-- C++
ls.add_snippets('cpp', {
  s('hello', {
    t('#include <iostream>'),
    t({'', ''}),
    t({'', ''}),
    t('int main() {'),
    t({'', ''}),
    t({'', ''}),
    t('  std::cout << "Hello World!" << std::endl;'),
    t({'', ''}),
    t({'', ''}),
    t('  return 0;'),
    t({'', ''}),
    t('}'),
  })
})

-- TODO
ls.add_snippets('cpp', {
  s('competprog-', {
    t('#include <iostream>'),
    t({'', ''}),
    t({'', ''}),
    t('int main() {'),
    t({'', ''}),
    t({'', ''}),
    t('  std::cout << "Hello World!" << std::endl;'),
    t({'', ''}),
    t({'', ''}),
    t('  return 0;'),
    t({'', ''}),
    t('}'),
  })
})

-- HTML
ls.add_snippets('html', {
  s('block', {
    t('{{ block "block-name" . }}'),
    t({'', ''}),
    t('<div>'),
    t({'', ''}),
    t('  ...'),
    t({'', ''}),
    t('<div>'),
    t({'', ''}),
    t('{{ end }}'),
  })
})


-- TODO: make email templates
