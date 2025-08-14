const ALL_ECMASCRIPT_GLOB = '*.{js,jsx,ts,tsx}';
const ALL_RUBY_GLOB = '*.{rb,haml,rbs,jbuilder}';
const ALL_YAML_GLOB = '*.{yml,yaml}';
const PACKAGE_JSON_GLOB = 'package.json';

module.exports = {
  // Common config across all files
  printWidth: 100,
  trailingComma: 'all',
  // Prose wrap "Always" forces formatting of line wrapping in markdown files. It shouldn't affect other file types.
  proseWrap: 'always',
  overrides: [
    {
      files: ALL_RUBY_GLOB,
      options: {
        plugins: ['@prettier/plugin-ruby'],
        rubySingleQuote: true,
        semi: false,
        // needed for vscode extension
        parser: 'ruby',
      },
    },
    {
      files: ALL_ECMASCRIPT_GLOB,
      options: {
        semi: true,
        singleQuote: true,
      },
    },
    {
      files: ALL_YAML_GLOB,
      options: {
        singleQuote: true,
      },
    },
    {
      files: PACKAGE_JSON_GLOB,
      options: {
        plugins: ['prettier-plugin-packagejson'],
      },
    },
  ],
};
