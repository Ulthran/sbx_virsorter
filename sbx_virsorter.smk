try:
    SBX_VIRSORTER_VERSION = get_ext_version("sbx_virsorter")
except NameError:
    # For backwards compatibility with older versions of Sunbeam
    SBX_VIRSORTER_VERSION = "0.0.0"

try:
    logger = get_extension_logger("sbx_virsorter")
except NameError:
    # For backwards compatibility with older versions of Sunbeam
    import logging

    logger = logging.getLogger("sunbeam.pipeline.extensions.sbx_virsorter")


localrules:
    all_virsorter,


rule all_virsorter:
    input:
        expand(
            VIRUS_FP / "virsorter2" / "{sample}" / "final-viral-combined.fa",
            sample=Samples,
        ),


rule run_virsorter2:
    input:
        ASSEMBLY_FP / "contigs" / "{sample}-contigs.fa",
    output:
        VIRUS_FP / "virsorter2" / "{sample}" / "final-viral-combined.fa",
    log:
        LOG_FP / "run_virsorter2_{sample}.log",
    benchmark:
        BENCHMARK_FP / "run_virsorter2_{sample}.tsv"
    params:
        db=Cfg["sbx_virsorter"]["virsorter_db"],
    conda:
        "envs/sbx_virsorter_env.yml"
    container:
        f"docker://sunbeamlabs/sbx_virsorter:{SBX_VIRSORTER_VERSION}"
    shell:
        """
        (virsorter config --init-source --db-dir {params.db}) > {log} 2>&1
        (virsorter run -w $(dirname {output}) -i {input} --min-length 1500 -j 4 all) >> {log} 2>&1
        """
