## horizon-core extensions

- Extension should produce `./dist/${EXTENSION_NAME}-bundle.js`.
- GMBinding.json is required.
- export functions for GMBinding in main .js as global, ex: `global.functionName = functionName`.

### Dependencies
- `npm install --global gulp-cli`
- `npm install --global browserify`

## Deploy to YYP

Deploy all extension:
```
sh deploy.sh
```

Deploy specified extension
```
sh deploy.sh <extension-name>...
```

