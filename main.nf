#!/usr/bin/env nextflow

/*
 * Copyright (c) 2017-2019, Centre for Genomic Regulation (CRG) and the authors.
 *
 *   This file is part of 'nf-UPF-Biologia-Humana 2019-2020'.
 *
 *   nf-UPF-Biologia-Humana is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   nf-UPF-Biologia-Humana is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with nf-UPF-Biologia-Humana.  If not, see <http://www.gnu.org/licenses/>.
 */

 /* 
 * Main nf-UPF-Biologia-Humana pipeline script
 *
 * @authors
 */

params.genomeFa
params.index
params.contig
params.genomic
// output directory
params.output = "$baseDir/results"

log.info """\
         NF    U P F  - B I O L O G I A    H U M A N A   19-20    ~  version 0.1"
         ======================================="
         Input Genome       (FA)                        : ${params.genomeFA}
         Input index                                    : ${params.index}
         Output directory (DIRECTORY)                   : ${params.output}
         \
         """
         .stripIndent()

// Channels containing the genome Fasta file
if ( params.genomeFa ) {
  Channel
  .fromPath(params.genomeFa)
  .map { item -> [ item.baseName, item] }
  .set { genome }
}

// Channels containing the index file
if ( params.index ) {
  Channel
  .fromPath(params.index)
  .map { item -> [ item.baseName, item] }
  .set { index }
}

process blast {}

process fastaFetch {}

process fastaSubseq {}

process exonerate {}

process fastaseqFromGff {}

process fastaTranslate {}

process tcoffee {}

process genewise {}

