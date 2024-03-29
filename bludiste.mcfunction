{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyPiQmgj8akSZnkGVzBP3q+i"
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "code",
      "execution_count": 33,
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "t_W9dwf3di52",
        "outputId": "defee0ed-714e-4dd0-e16c-006833baf0fa"
      },
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "IOPub data rate exceeded.\n",
            "The notebook server will temporarily stop sending output\n",
            "to the client in order to avoid crashing it.\n",
            "To change this limit, set the config variable\n",
            "`--NotebookApp.iopub_data_rate_limit`.\n",
            "\n",
            "Current values:\n",
            "NotebookApp.iopub_data_rate_limit=1000000.0 (bytes/sec)\n",
            "NotebookApp.rate_limit_window=3.0 (secs)\n",
            "\n"
          ]
        }
      ],
      "source": [
        "from PIL import Image\n",
        "\n",
        "def fill(x1,y1,z1,x2,y2,z2,material):\n",
        "  return \"fill ~{} ~{} ~{} ~{} ~{} ~{} {}\".format(x1, y1, z1, x2, y2, z2, material) + \"/n\"\n",
        "\n",
        "planek=Image.open(\"maze.png\")\n",
        "sloupce,radky=planek.size\n",
        "print(sloupce,radky)\n",
        "\n",
        "body=planek.load()\n",
        "\n",
        "vystup=\"\"\n",
        "vystup += fill(0,-1,0,sloupce,-2,radky,\"water\")\n",
        "vystup += fill(0,-3,0,sloupce,-3,radky,\"gold_block\")\n",
        "\n",
        "\n",
        "for radek in range(radky):\n",
        "  linka=\"\"\n",
        "  for sloupec in range(sloupce):\n",
        "    bod=body[sloupec,radek]\n",
        "    if not(bod[1]==255 and bod[2]==255):\n",
        "      #print(bod)\n",
        "      if bod[0]==bod[1] and bod[2]==bod[1] and bod[2]==bod[0]:\n",
        "        linka += \"#\"\n",
        "        vystup += fill(sloupec,1,radek,sloupec,3,radek,\"gold_block\")\n",
        "\n",
        "      if bod[0]==255 and bod[1]==bod[2]:\n",
        "        linka += \"=\"\n",
        "        vystup += fill(sloupec,-3,radek,sloupec,-3,radek,\"glowstone\")\n",
        "\n",
        "    else:\n",
        "      linka += \".\"\n",
        "\n",
        "  print(vystup)"
      ]
    }
  ]
}
