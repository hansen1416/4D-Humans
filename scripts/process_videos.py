import os
import subprocess

target_folder = os.path.join("/4D-Humans", "videos")
results_folder = os.path.join("/4D-Humans", "output")

# list all files in `target_folder`
files = os.listdir(target_folder)

print(f"got {len(files)} files")

for f in files:

    file_name = f.split(".")[0]

    # check if the results already exists
    if os.path.exists(os.path.join(results_folder, file_name)):
        print(f"{f} already processed")
        continue
    else:
        print(f"{f} in process")

    video_path = os.path.join(target_folder, f)
    result_path = os.path.join(results_folder, file_name)

    # python track.py video.source="example_data/videos/gymnasts.mp4"
    command = [
        "python",
        "track.py",
        f'video.source="{video_path}"',
        f'video.output_dir="{result_path}"',
    ]

    subprocess.run(command, check=True)
