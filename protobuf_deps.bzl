"""Load dependencies needed to compile the protobuf library as a 3rd-party consumer."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

PROTOBUF_MAVEN_ARTIFACTS = [
    "com.google.code.findbugs:jsr305:3.0.2",
    "com.google.code.gson:gson:2.8.9",
    "com.google.errorprone:error_prone_annotations:2.3.2",
    "com.google.j2objc:j2objc-annotations:1.3",
    "com.google.guava:guava:31.1-jre",
    "com.google.guava:guava-testlib:31.1-jre",
    "com.google.truth:truth:1.1.2",
    "junit:junit:4.13.2",
    "org.mockito:mockito-core:4.3.1",
]

def protobuf_deps():
    """Loads common dependencies needed to compile the protobuf library."""

    if not native.existing_rule("bazel_skylib"):
        http_archive(
            name = "bazel_skylib",
            sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
                "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            ],
        )

    if not native.existing_rule("com_google_absl"):
        # Abseil LTS from November 2021
        http_archive(
            name = "com_google_absl",
            sha256 = "b4e20d9e752a75c10636675691b1e9c2698e0764cb404987d0ffa77223041c19",
            urls = ["https://github.com/abseil/abseil-cpp/archive/215105818dfde3174fe799600bb0f3cae233d0bf.zip"],
            strip_prefix = "abseil-cpp-215105818dfde3174fe799600bb0f3cae233d0bf",
        )

    if not native.existing_rule("zlib"):
        http_archive(
            name = "zlib",
            build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
            sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
            strip_prefix = "zlib-1.2.11",
            urls = ["https://github.com/madler/zlib/archive/v1.2.11.tar.gz"],
        )

    if not native.existing_rule("rules_cc"):
        http_archive(
            name = "rules_cc",
            sha256 = "9d48151ea71b3e225adfb6867e6d2c7d0dce46cbdc8710d9a9a628574dfd40a0",
            strip_prefix = "rules_cc-818289e5613731ae410efb54218a4077fb9dbb03",
            urls = ["https://github.com/bazelbuild/rules_cc/archive/818289e5613731ae410efb54218a4077fb9dbb03.tar.gz"],
        )

    if not native.existing_rule("rules_java"):
        http_archive(
            name = "rules_java",
            sha256 = "f5a3e477e579231fca27bf202bb0e8fbe4fc6339d63b38ccb87c2760b533d1c3",
            strip_prefix = "rules_java-981f06c3d2bd10225e85209904090eb7b5fb26bd",
            urls = ["https://github.com/bazelbuild/rules_java/archive/981f06c3d2bd10225e85209904090eb7b5fb26bd.tar.gz"],
        )

    if not native.existing_rule("rules_proto"):
        http_archive(
            name = "rules_proto",
            sha256 = "a4382f78723af788f0bc19fd4c8411f44ffe0a72723670a34692ffad56ada3ac",
            strip_prefix = "rules_proto-f7a30f6f80006b591fa7c437fe5a951eb10bcbcf",
            urls = ["https://github.com/bazelbuild/rules_proto/archive/f7a30f6f80006b591fa7c437fe5a951eb10bcbcf.zip"],
        )

    if not native.existing_rule("rules_python"):
        http_archive(
            name = "rules_python",
            sha256 = "9fcf91dbcc31fde6d1edb15f117246d912c33c36f44cf681976bd886538deba6",
            strip_prefix = "rules_python-0.8.0",
            url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.8.0.tar.gz",
        )

    if not native.existing_rule("rules_jvm_external"):
        http_archive(
            name = "rules_jvm_external",
            sha256 = "744bd7436f63af7e9872948773b8b106016dc164acb3960b4963f86754532ee7",
            strip_prefix = "rules_jvm_external-906875b0d5eaaf61a8ca2c9c3835bde6f435d011",
            urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/906875b0d5eaaf61a8ca2c9c3835bde6f435d011.zip"],
        )

    if not native.existing_rule("rules_pkg"):
        http_archive(
            name = "rules_pkg",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.7.0/rules_pkg-0.7.0.tar.gz",
                "https://github.com/bazelbuild/rules_pkg/releases/download/0.7.0/rules_pkg-0.7.0.tar.gz",
            ],
            sha256 = "8a298e832762eda1830597d64fe7db58178aa84cd5926d76d5b744d6558941c2",
        )

    if not native.existing_rule("io_bazel_rules_kotlin"):
        http_archive(
            name = "io_bazel_rules_kotlin",
            urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/v1.5.0-beta-4/rules_kotlin_release.tgz"],
            sha256 = "6cbd4e5768bdfae1598662e40272729ec9ece8b7bded8f0d2c81c8ff96dc139d",
        )

    if not native.existing_rule("upb"):
        git_repository(
            name = "upb",
            remote = "https://github.com/protocolbuffers/upb.git",
            commit = "a0bc6693b069e6d1f083c7727ea08621cea4155e",
        )
