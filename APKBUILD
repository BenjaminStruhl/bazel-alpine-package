# Maintainer: David Ostrovsky <david@ostrovsky.org>

pkgname=bazel
pkgver_virtual=6.0.0-pre.20211019.1
pkgver=6.0.0
pkgrel=0
pkgdesc='Correct, reproducible, and fast builds for everyone'
arch="all"
license="ASL-2.0"
url='https://bazel.io/'
depends="bash openjdk8 libarchive zip unzip"
# coreutils can be removed as a make dependency once expr in busybox is compatible with the BSD version, see following bug reports:
# Patch bazel: https://github.com/bazelbuild/bazel/issues/4055
# https://bugs.alpinelinux.org/issues/8121
makedepends="coreutils git linux-headers protobuf python3"
options="!distcc !strip !check"
source="https://github.com/bazelbuild/bazel/releases/download/${pkgver_virtual}/bazel-${pkgver_virtual}-dist.zip
        https://github.com/bazelbuild/bazel/releases/download/${pkgver_virtual}/bazel-${pkgver_virtual}-dist.zip.sig"
sha512sums="37463939a03cf2a25205242e0ad6e8d8d8394afe2dba7daf7b90016f98c352be424093c0264c1f18d09a62e27cca1e76ee89cc31724bf57d430c9f54cf84a3ef  bazel-6.0.0-pre.20211019.1-dist.zip
1beed08c7471cd8ebc754fa480d9b83a3f172368a6fb1f4b6284e17c3e48e4d4ef6ce64dbe5c53a2a283ff6312aa2b380fbef5fa9f98f08914a86bbcd327a584  bazel-6.0.0-pre.20211019.1-dist.zip.sig"

build() {
  export JAVA_HOME=/usr/lib/jvm/default-jvm
  EXTRA_BAZEL_ARGS=--host_javabase=@local_jdk//:jdk ./compile.sh
  scripts/generate_bash_completion.sh --bazel=output/bazel --output=output/bazel-complete.bash --prepend=scripts/bazel-complete-template.bash
  output/bazel shutdown
  echo startup --server_javabase=$JAVA_HOME >> scripts/packages/bazel.bazelrc
}

package() {
  install -Dm755 ${srcdir}/scripts/packages/bazel.sh ${pkgdir}/usr/bin/bazel
  install -Dm755 ${srcdir}/scripts/packages/bazel.bazelrc ${pkgdir}/etc/bazel.bazelrc
  install -Dm755 ${srcdir}/output/bazel ${pkgdir}/usr/bin/bazel-real
  install -Dm644 ${srcdir}/output/bazel-complete.bash ${pkgdir}/usr/share/bash-completion/completions/bazel
  install -Dm644 ${srcdir}/scripts/zsh_completion/_bazel ${pkgdir}/usr/share/zsh/site-functions/_bazel
}
# vim:set ts=2 sw=2 et:

