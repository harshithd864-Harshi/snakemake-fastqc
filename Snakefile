rule all:
    input:
        "results/multiqc_report.html"

rule fastqc:
    input:
        "data/SRR390728_1.fastq",
        "data/SRR390728_2.fastq"
    output:
        "results/SRR390728_1_fastqc.html",
        "results/SRR390728_1_fastqc.zip",
        "results/SRR390728_2_fastqc.html",
        "results/SRR390728_2_fastqc.zip"
    shell:
        """
        mkdir -p results
        fastqc {input} -o results
        """

rule multiqc:
    input:
        "results/SRR390728_1_fastqc.html",
        "results/SRR390728_2_fastqc.html"
    output:
        "results/multiqc_report.html"
    shell:
        """
        multiqc results -o results
        """
