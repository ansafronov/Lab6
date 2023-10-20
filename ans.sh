#5

cd practical_5_building_software/task_5/Graph-Executor/

WARN_FLAGS="-Wall -Wextra"
CXX_STANDARD="-std=c++14"
DEBUG_FLAGS="-g"
PTHREAD_FLAG="-pthread"

# Set G++ compiler
CXX="g++"

# Set source files
SOURCES="example_add.cpp example_cpu.cpp example_exp.cpp lock_free_thread_pool.cpp \
 lock_graph_executor.cpp lock_thread_pool.cpp main.cpp perform_tests.cpp perform_thread_pool_tests.cpp \
 single_graph_executor.cpp tester.cpp thread_pool_tester.cpp"

# Set object files
OBJECTS=""
for src in $SOURCES; do
    obj="${src%.*}.o"
    OBJECTS="$OBJECTS $obj"
done

mkdir headers;
for hdr in find *.hpp; do;
    mv hdr headers/hdr;
done;

# Compile source files to object files
for src in $SOURCES; do
    obj="${src%.*}.o"
    $CXX $WARN_FLAGS $CXX_STANDARD $DEBUG_FLAGS -Iheaders -c $src -o $obj
done

# Link object files to create the final executable
$CXX $OBJECTS $DEBUG_FLAGS $PTHREAD_FLAG -o tester
