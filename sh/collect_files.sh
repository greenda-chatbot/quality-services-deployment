find ./ -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" \) \
  -not -path "*/node_modules/*" \
  -not -path "*/.next/*" \
  -not -name "*.test.*" \
  -not -name "*.spec.*" \
  -not -name "*/public/*" \
  -not -name "*/.vscode/*" \
  -not -name "*/.git/*" \
  -not -name "*/.DS_Store" \
  -print0 | while IFS= read -r -d '' file;
do
  echo "File: $file"
  echo "Content:"
  sed 's|//.*||g; /\/\*.*\*\//d; /\/\*/,/\*\//d' "$file"
  echo
done > sh/nextjs_files_contents.txt

code sh/nextjs_files_contents.txt

pbcopy < sh/nextjs_files_contents.txt
