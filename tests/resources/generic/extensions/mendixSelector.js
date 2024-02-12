// Generate the libspec file for this extension using the command below:
// python -m robot.libdoc -f libspec Browser::jsextension="<path to .js file>" "<path to libspec folder>\filename.libspec"

async function registerMendixSelector(playwright) {
  playwright.selectors.register("mx", () => ({
    // Returns the first element matching given selector in the root's subtree.
    query(root, selector) {
      return root.querySelector(`.mx-name-${selector}`);
    },

    // Returns all elements matching given selector in the root's subtree.
    queryAll(root, selector) {
      return Array.from(root.querySelectorAll(`.mx-name-${selector}`));
    }
  }));
  return 1;
}

exports.__esModule = true;
exports.registerMendixSelector = registerMendixSelector;
