class GithubContributions < Formula
  desc "GitHub contributions"
  homepage "https://github.com/wk-j/github-contributions"
  url "https://github.com/wk-j/github-contributions/releases/download/0.1.0/github-contributions.0.1.0.zip"
  version "0.1.0"
  sha256 "7346e2565db70469b3ce668ed89c132678c1ebce5ec7623dcb8b5b9dfa09ad54"

  # depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    # To match non-mono install, create an `omnisharp' shell script.
    (bin/"github-contributions").write <<-EOS.undent
      #!/usr/bin/env sh
      dotnet /usr/local/opt/github-contributions/libexec/GitHubContributions.dll $@
    EOS
  end

  def post_install
    system "/bin/chmod +x #{bin}/github-contributions"
  end

end
