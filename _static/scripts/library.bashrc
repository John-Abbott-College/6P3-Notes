# Download a webpage including its images/assets
# Starting point: https://superuser.com/questions/1415717/how-to-download-an-entire-site-with-wget-including-its-images
wget_website() {
  local target="${1}"
  if [ $# -lt 1 ]; then
    echo "Need to provide a URL" && return;
  fi

  wget \
      --recursive \
      --level 5 \
      --no-clobber \
      --page-requisites \
      --adjust-extension \
      --span-hosts \
      --convert-links \
      --domains "${target}" \
      --execute robots=off \
      --no-parent \
          "${target}"
}
