const App = require('md-docs-cli/app');

module.exports = class MyApp extends App {
  constructor(options) {
    super(options);
  }

  _getServices(options) {
    const services = super(options);

    //Option 1
    services['newFileParser'] = asClass(NewFileParser).singleton();
    services.fileParsers.push('newFileParser');

    //Option 2
    services['newHtmlParser'] = asClass(NewHtmlParser).singleton();
    services.htmlParsers.push('newHtmlParser');

    //Option 3
    services['newAnchorParser'] = asClass(NewAnchorParser).singleton();
    services.anchorParsers.push('newAnchorParser');

    //Option 4
    services.pageComponent = asClass(MyPageComponent).singleton();

    //Option 5
    services.pageComponentRenderFn = asValue((data) => '<html />');

    return services;
  }
}